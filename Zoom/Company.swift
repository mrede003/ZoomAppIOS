//
//  Company.swift
//  Zoom
//
//  Created by Matthew Redenius on 8/8/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation
import Firebase

class Company {
    public private(set) var apptEmails = [String]()
    public private(set) var noti_delay: Int
    public private(set) var noti_message: String
    public private(set) var noti_title: String
    public private(set) var monThursO: String
    public private(set) var monThursC: String
    public private(set) var friO: String
    public private(set) var friC: String
    public private(set) var satC: String
    public private(set) var satO: String
    public private(set) var sunO: String
    public private(set) var sunC: String
    public private(set) var emailPort: String
    public private(set) var smtpAuth: Bool
    public private(set) var starttls: Bool
    public private(set) var emailHost: String
    public private(set) var fromEmail: String
    public private(set) var fromPassword: String
    public private(set) var facebook_url: String
    public private(set) var facebook_page_id: String
    public private(set) var twitter_username: String
    public private(set) var insta_id: String
    public private(set) var google_plus_id: String
    public private(set) var website_url: String
    
    init(dictionary: NSDictionary)
    {
        self.apptEmails = dictionary["apptEmails"] as? [String] ?? ["Zoompass123"]
        self.noti_delay = dictionary["noti_delay"] as? Int ?? 30000
        self.noti_message = dictionary["noti_message"] as? String ?? "Notification Message"
        self.noti_title = dictionary["noti_title"] as? String ?? "Notification Title"
        self.monThursO = dictionary["monThursO"] as? String ?? "9AM"
        self.monThursC = dictionary["monThursC"] as? String ?? "8PM"
        self.friO = dictionary["friO"] as? String ?? "9AM"
        self.friC = dictionary["friC"] as? String ?? "8PM"
        self.satO = dictionary["satO"] as? String ?? "9AM"
        self.satC = dictionary["satC"] as? String ?? "8AM"
        self.sunO = dictionary["sunO"] as? String ?? "11AM"
        self.sunC = dictionary["sunC"] as? String ?? "6PM"
        self.emailPort = dictionary["emailPort"] as? String ?? "587"
        self.smtpAuth = dictionary["smtpAuth"] as? Bool ?? true
        self.starttls = dictionary["starttls"] as? Bool ?? true
        self.emailHost = dictionary["smtpAuth"] as? String ?? "smtp.gmail.com"
        self.fromEmail = dictionary["fromEmail"] as? String ?? "appointmentzoomva@gmail.com"
        self.fromPassword = dictionary["fromPassword"] as? String ?? "Zoompass123"
        self.facebook_url = dictionary["facebook_url"] as? String ?? "https://www.facebook.com/ZoomWirelssofVA"
        self.facebook_page_id = dictionary["facebook_page_id"] as? String ?? "ZoomWirelessofVA"
        self.twitter_username = dictionary["twitter_username"] as? String ?? "zoomwirelessva"
        self.insta_id = dictionary["insta_id"] as? String ?? "verizon"
        self.google_plus_id = dictionary["google_plus_id"] as? String ?? "+verizon"
        self.website_url = dictionary["website_url"] as? String ?? "https://www.verizon.com"
    }
}
