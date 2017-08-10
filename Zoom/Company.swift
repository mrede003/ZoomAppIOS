//
//  Company.swift
//  Zoom
//
//  Created by Matthew Redenius on 8/8/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation

struct Company {
    var apptEmails = [String]()
    var noti_delay: Int
    var noti_message: String
    var noti_title: String
    var monThursO: String
    var monThursC: String
    var friO: String
    var friC: String
    var satC: String
    var satO: String
    var sunO: String
    var sunC: String
    var emailPort: String
    var smtpAuth: String
    var starttls: String
    var emailHost: String
    var fromEmail: String
    var fromPassword: String
    var facebook_url: String
    var facebook_page_id: String
    var twitter_username: String
    var insta_id: String
    var google_plus_id: String
    var website_url: String
    
    init(apptEmails: [String], noti_delay: Int, noti_message: String, noti_title: String, monThursO: String, monThurs: String, monThursC: String,
        friO: String, friC: String, satO: String, satC: String, sunO: String, sunC: String, emailPort: String, smtpAuth: String, starttls: String,
        emailHost: String, fromEmail: String, fromPassword: String, facebook_url: String, facebook_page_id: String, twitter_username: String, insta_id: String,
        google_plus_id: String, website_url: String)
    {
        self.apptEmails = apptEmails
        self.noti_delay = noti_delay
        self.noti_message = noti_message
        self.noti_title = noti_title
        self.monThursO = monThursO
        self.monThursC = monThursC
        self.friO = friO
        self.friC = friC
        self.satO = satO
        self.satC = satC
        self.sunO = sunO
        self.sunC = sunC
        self.emailPort = emailPort
        self.smtpAuth = smtpAuth
        self.starttls = starttls
        self.emailHost = emailHost
        self.fromEmail = fromEmail
        self.fromPassword = fromPassword
        self.facebook_url = facebook_url
        self.facebook_page_id = facebook_page_id
        self.twitter_username = twitter_username
        self.insta_id = insta_id
        self.google_plus_id = google_plus_id
        self.website_url = website_url
    }
    
}
