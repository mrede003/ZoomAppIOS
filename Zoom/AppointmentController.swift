//
//  AppointmentController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/21/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import Toast_Swift

class AppointmentController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    var companyObj: Company?
    var storeList: Stores?
    
    let MONDAY_SATURDAY = 0
    
    // FIXME: These values should be dynamic based on what is in the database
    let minWeekdayAppointmentTime = 9
    let minSundayAppointmentTime = 11
    let maxWeekdayAppointmentTime = 19
    let maxSundayAppointmentTime = 17
    let halfHourinMinutes = 30
    
    let placeholderText = "Please give a brief description of the reason for you appointment....."
    
    let datePickerView = UIDatePicker()
    let timePickerView = UIDatePicker()
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var areaCodeNumber: UITextField!
    @IBOutlet weak var datePicker: UITextField!
    @IBOutlet weak var lastNumber: UITextField!
    @IBOutlet weak var middleNumber: UITextField!
    @IBOutlet weak var timePicker: UITextField!
    @IBOutlet weak var locationPicker: UITextField!
    @IBOutlet weak var repPicker: UITextField!
    @IBOutlet weak var descriptionForVisit: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBAction func requestAppointmentButton(_ sender: UIButton) {
        if(canRequest()) {
            self.view.makeToast("Making appointment", duration: 3.0, position: .center)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Observers to watch for keyboard appearence
        registerKeyboardNotifications()
        
        // Add Gesture Recognizer to hide keyboard when a tap is made outside of a textview
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        // Set Delagates
        descriptionForVisit.delegate = self
        timePicker.delegate = self
        
        // Set up placeholder text in description text view
        descriptionForVisit.text = placeholderText
        descriptionForVisit.textColor = UIColor.lightGray
        
        // Set Pickers to appropriate textFields
        setUpTimePicker()
        setUpDatePicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Helper functions
    
    func sendEmail(message : String) {
        
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardInfo = userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        let keyboardSize = keyboardInfo.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if(textView == descriptionForVisit) {
            // Remove placeholder text so user can edit
            if textView.textColor == UIColor.lightGray {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if(textView == descriptionForVisit) {
            // Add placeholder text if the field is empty
            if textView.text == "" {
                textView.text = placeholderText
                textView.textColor = UIColor.lightGray
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if(textField == timePicker) {
            
            // Set min appointment time
            var minimumTime: Date?
            var timeComponent = DateComponents()
            
            // If the date is today.
            if(isDateToday(selectedDate: datePickerView.date)) {
                
                // If there is time for appoitments left
                if(timeForAppointmentsIsLeft()) {
                    
                    // Minimum time to make an appointment is current time + 1 hour
                    timeComponent.hour = getCurrentHour() + 1
                    timeComponent.minute = getCurrentMinute()
                    
                    minimumTime = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: timeComponent)
                    
                } else {
                    
                    // No time for appointments left today
                    // Fast fail and prompt user to chooser another date
                    self.view.makeToast("No appointments left for today, please choose another date!", duration: 3.0, position: .center)
                    return false
                }
            } else {
                
                // The date is a future date, set min/max times as open/close
                if(datePickerView.date.dayOfWeek() == MONDAY_SATURDAY) {
                    timeComponent.hour = minWeekdayAppointmentTime
                } else {
                    timeComponent.hour = minSundayAppointmentTime
                }
                timeComponent.minute = halfHourinMinutes
                minimumTime = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: timeComponent)
            }
            
            // Set max appointment time
            timeComponent.hour = (getLatestAppointmentTime(selectedDate: datePickerView.date))
            timeComponent.minute = 0
            let maximumTime = Calendar.current.date(from: timeComponent)
            
            // Set timepicker
            timePickerView.minimumDate = minimumTime
            timePickerView.maximumDate = maximumTime
            
            textField.inputView = timePickerView
        }
        return true
    }
    
    func setUpDatePicker() {
        
        // init date picker and at it to date text field
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action:  #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        // Set minimum and maximum dates
        var dateComponent = DateComponents()
        dateComponent.year = 2
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        
        datePickerView.minimumDate = Date()
        datePickerView.maximumDate = futureDate
        
        datePicker.inputView = datePickerView
        
        // Set Default Date
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        datePicker.text = formatter.string(from: datePickerView.date)
    }
    
    func setUpTimePicker() {
        timePickerView.datePickerMode = UIDatePickerMode.time
        timePickerView.addTarget(self, action:  #selector(timePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        timePicker.inputView = timePickerView
    }
    
    func getCurrentHour() -> Int {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        print(components.hour!)
        return components.hour!
    }
    
    func getCurrentMinute() -> Int {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        print(components.minute!)
        return components.minute!
    }
    
    func getLatestAppointmentTime(selectedDate : Date) -> Int{
        
        if(selectedDate.dayOfWeek() == MONDAY_SATURDAY) {
            return maxWeekdayAppointmentTime
        }
        return maxSundayAppointmentTime
    }
    
    func isDateToday(selectedDate: Date) -> Bool {
        let currentDate = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: currentDate)
        
        let selectedCalender = Calendar.current
        let selectedComponents = selectedCalender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: selectedDate)
        
        if(components.year == selectedComponents.year
            && components.month == selectedComponents.month
            && components.day == selectedComponents.day) {
            print("The date is today")
            return true
        }
        return false
        
        //return selectedDate == Date()
    }
    
    // This function operates under the assumption that the date 
    // in question is today's date
    func timeForAppointmentsIsLeft() -> Bool {
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let latestAppointmentHour = getLatestAppointmentTime(selectedDate: Date())
        let currentHour = components.hour
        if(currentHour! + 1 < latestAppointmentHour) {
            return true
        }
        return false
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        datePicker.text = formatter.string(from: sender.date)
    }
    
    func timePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.none
        formatter.timeStyle = DateFormatter.Style.short
        timePicker.text = formatter.string(from: sender.date)
    }
    
    // MARK: Logic functions
    
    // Returns true if all neccessary field are filled
    func canRequest() -> Bool {
        
        // There's probably better ways to check if nil but I'm a Java programmer so give me a break
        // Make sure
        if(firstName.text == nil || firstName.text == "") {
            self.view.makeToast("Please input first name!", duration: 2.0, position: .center)
            return false
        }
        
        // Make sure last name field is filled in
        if(lastName.text == nil || lastName.text == "") {
            self.view.makeToast("Please input last name!", duration: 2.0, position: .center)
            return false
        }
        
        // Make sure phone number fields are filled in
        if(areaCodeNumber.text == nil || areaCodeNumber.text?.characters.count != 3
            || middleNumber.text == nil || middleNumber.text?.characters.count != 3
            || lastNumber.text == nil || lastNumber.text?.characters.count != 4 ) {
            self.view.makeToast("Please 10 digit phone number!", duration: 3.0, position: .center)
            return false
        }
        
        if(firstName.text == nil || firstName.text == "") {
            self.view.makeToast("Please input first name!", duration: 3.0, position: .center)
            return false
        }
        
        if(firstName.text == nil || firstName.text == "") {
            self.view.makeToast("Please input first name!", duration: 3.0, position: .center)
            return false
        }
        
        if(firstName.text == nil || firstName.text == "") {
            self.view.makeToast("Please input first name!", duration: 3.0, position: .center)
            return false
        }
        
        if(firstName.text == nil || firstName.text == "") {
           self.view.makeToast("Please input first name!", duration: 3.0, position: .center)
            return false
        }
        
        return true;
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// Extends Date to return if day of the week is or is not a sunday
// Used to determine setting min/max time in the time picker for day of the week
extension Date {
    func dayOfWeek() -> Int? {
        let MONDAY_SATURDAY = 0
        let SUNDAY = 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        print(dateFormatter.string(from: self).capitalized)
        switch (dateFormatter.string(from: self).capitalized) {
            case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday":
                return MONDAY_SATURDAY
            default :
                return SUNDAY
        }
    }
}
