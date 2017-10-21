//
//  MainViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/7/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import UserNotifications
class MainViewController: UIViewController, CLLocationManagerDelegate{
    
    var companyObj: Company?
    var promoList: Promos?
    var storeList: Stores?
    var firstTimeRun = false
    
    let backGroundImageOneNum = 1
    let backGroundImageTwoNum = 2
    let backGroundImageThreeNum = 3
    let backGroundImageFourNum = 4
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    let locationManager = CLLocationManager()
    @IBAction func openWebpageButton(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: (companyObj?.website_url)!)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Alternating background on load
        let defaults = UserDefaults.standard
        var background = defaults.integer(forKey: "background")
        
        // If this is the first time the app has been ran
        if(background == 0) {
            background = 1
            firstTimeRun = true
        }
        
        if(background == backGroundImageOneNum) {
            backgroundImage.image = #imageLiteral(resourceName: "back_one")
        }
        
        if(background == backGroundImageTwoNum) {
            backgroundImage.image = #imageLiteral(resourceName: "back_two")
        }
        
        if(background == backGroundImageThreeNum) {
            backgroundImage.image = #imageLiteral(resourceName: "back_three")
        }
        
        if(background == backGroundImageFourNum) {
            backgroundImage.image = #imageLiteral(resourceName: "back_four")
            background = backGroundImageOneNum
        } else {
            background += background
        }
        
        defaults.set(background, forKey: "background")
    }
    
    func setUpDefaultNotification() {
        if #available(iOS 10.0, *) {
            print("setUpNotifications ran")
            let center = UNUserNotificationCenter.current()
            center.getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    // Notifications not allowed
                    return
                }
                let content = UNMutableNotificationContent()
                content.title = (self.companyObj?.noti_title)!
                content.body = (self.companyObj?.noti_message)!
                content.sound = UNNotificationSound.default()
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7200,
                                                                repeats: false)
                let identifier = "UYLLocalNotification"
                let request = UNNotificationRequest(identifier: identifier,
                                                    content: content, trigger: trigger)
                center.add(request, withCompletionHandler: { (error) in
                    if let error = error {
                        print("Something went wrong")
                    }
                })
            }
        } else {
            // Fallback on earlier version
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: .UIApplicationWillResignActive, object: nil)
        self.locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        if(firstTimeRun) {
            setUpDefaultNotification()
            firstTimeRun = false
        }
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willResignActive(_ notification: Notification) {
        if(firstTimeRun) {
            setUpDefaultNotification()
            firstTimeRun = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        sortStoresByDistanceAway(userLocation: locations[0])
    }
    
    func sortStoresByDistanceAway(userLocation : CLLocation) {
        
        // Calculate distance away from user and saved value in each store
        for currentStore in (storeList?.storeList)! {
            let coordinate = CLLocation(latitude: currentStore.latitude!, longitude: currentStore.longitude!)
            currentStore.milesAway = 0.000621371 * (coordinate.distance(from: userLocation))
        }
        
        // Sort all store in storeList in descending order by distance away
        storeList?.storeList = (storeList?.storeList)!.sorted(by: { $0.milesAway! < $1.milesAway! })
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToPromoTableSeque" {
            
            let secondController = segue.destination as! PromoTableViewController
            secondController.promoList = self.promoList
            secondController.storeList = self.storeList
            secondController.companyObj = self.companyObj
            
        } else if segue.identifier == "MaintoLocations" {
            
            let secondController = segue.destination as! LocationTableViewController
            secondController.companyObj = self.companyObj
            secondController.storeList = self.storeList
            
        } else if segue.identifier == "MainToSocialMedia" {
            
            let secondController = segue.destination as! SocialMediaTableViewController
            secondController.companyObj = self.companyObj
            
        } else if segue.identifier == "MainToAppointment" {
            
            let secondController = segue.destination as! AppointmentController
            secondController.companyObj = self.companyObj
            secondController.storeList = self.storeList
            
        }
    }
}
