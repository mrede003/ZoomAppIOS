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

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("company").child("zoom")
        let word = "hello"
        print(word)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let twitter_username = value?["twitter_username"] as? String ?? ""
            print(twitter_username)
            
        })
        //begin to populate the database
        //load the initial screen
        //add listeners?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

