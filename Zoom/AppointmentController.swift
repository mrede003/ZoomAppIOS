//
//  AppointmentController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/21/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import Toast_Swift

class AppointmentController: UIViewController, UITextViewDelegate {

    var companyObj: Company?
    var storeList: Stores?
    
    let placeholderText = "Please give a brief description of the reason for you appointment....."
    
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
        
        //Set Observers to watch for keyboard appearence
        registerKeyboardNotifications()
        
        //Add Gesture Recognizer to hide keyboard when a tap is made outside of a textview
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        //Set up placeholder text in description text view
        descriptionForVisit.delegate = self
        descriptionForVisit.text = placeholderText
        descriptionForVisit.textColor = UIColor.lightGray
        
        //Set Pickers to appropriate textFields
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
        
        //Remove placeholder text so user can edit
        if descriptionForVisit.textColor == UIColor.lightGray {
            descriptionForVisit.text = ""
            descriptionForVisit.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        //Add placeholder text if the field is empty
        if descriptionForVisit.text == "" {
            descriptionForVisit.text = placeholderText
            descriptionForVisit.textColor = UIColor.lightGray
        }
    }
    
    func setUpDatePicker() {
        //init date picker and at it to date text field
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self, action:  #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        datePicker.inputView = datePickerView
        
        
    }
    
    func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        datePicker.text = formatter.string(from: sender.date)
        
    }
    
    //MARK: Logic functions
    
    //Returns true if all neccessary field are filled
    func canRequest() -> Bool {
        
        //There's probably better ways to check if nil but I'm a Java programmer so give me a break
        //Make sure
        if(firstName.text == nil || firstName.text == "") {
            self.view.makeToast("Please input first name!", duration: 2.0, position: .center)
            return false
        }
        
        //Make sure last name field is filled in
        if(lastName.text == nil || lastName.text == "") {
            self.view.makeToast("Please input last name!", duration: 2.0, position: .center)
            return false
        }
        
        //Make sure phone number fields are filled in
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
