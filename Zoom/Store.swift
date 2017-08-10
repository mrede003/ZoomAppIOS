//
//  Store.swift
//  Zoom
//
//  Created by Matthew Redenius on 8/9/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation

struct Store {
    var staff: [String]
    var email, address, name, storeImg, bio, storeImgPre, phoneNumber, googleRateLink : String
    var latitude, longitude, milesAway : Double
    
    init(staff : [String], email : String, address : String, name : String, storeImg : String, bio : String, storeImgPre : String, phoneNumber : String,
         googleRateLink : String, latitude : Double, longitude : Double, milesAway : Double) {
        
        self.staff = staff
        self.email = email
        self.address = address
        self.name = name
        self.storeImg = storeImg
        self.bio = bio
        self.storeImgPre = storeImgPre
        self.phoneNumber = phoneNumber
        self.googleRateLink = googleRateLink
        self.latitude = latitude
        self.longitude = longitude
        self.milesAway = milesAway
    }
}
