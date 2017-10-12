//
//  AppointmentController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/21/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import Toast_Swift

class AppointmentController: UIViewController {

    var companyObj: Company?
    var storeList: Stores?
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.makeToast("This is a piece of toast", duration: 3.0, position: .center)
        
        //Set Observers to watch for keyboard appearence
        registerKeyboardNotifications()
        
        //Add Gesture Recognizer to hide keyboard when a tap is made outside of a textview
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
