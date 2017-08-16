//
//  ViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 5/18/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference?
    var companyDictionary: NSDictionary?
    var promosArray: NSArray?
    var storeDictionary: NSDictionary?
    var companyObj: Company?
    var promoList: Promos?
    var storeList: Stores?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            self.companyDictionary = snapshot.value as? NSDictionary
        })
        
        loadFirebase()
        print("Database loaded.... Hopefully")
        //begin to populate the database
        //load the initial screen
        //add listeners?
    }
    func loadFirebase()
    {
        
        ref = Database.database().reference()
        ref?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dict = snapshot.value as? NSDictionary {
                
                //Populate the company information
                if let newDict = dict["company"] as? NSDictionary {                     //This right here is an example of bad database design
                    self.companyDictionary = newDict["zoom"] as? NSDictionary ?? nil
                    if (self.companyDictionary != nil){
                        self.companyObj = Company(dictionary: self.companyDictionary!)
                    }
                }
                
                //Populate all the stores information
                self.storeDictionary = dict["stores"] as? NSDictionary ?? nil
                if(self.storeDictionary != nil) {
                    self.storeList = Stores(storeDict: self.storeDictionary!)
                }
                
                //Populate all promo information
                self.promosArray = dict["promos"] as? NSArray ?? nil
                if (self.promosArray != nil) {
                    self.promoList = Promos(promoArray: self.promosArray as! [NSDictionary])
                }
            }
        })
        print("hello")
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

