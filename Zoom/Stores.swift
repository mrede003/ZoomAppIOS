
//
//  Stores.swift
//  Zoom
//
//  Created by Matthew Redenius on 8/9/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation

class Stores {
    
    public private(set) var storeList : [Store]?
    
    init(storeDict: NSDictionary) {
        storeList = [Store]()
        for (key, value) in storeDict {
            let tempStore = Store(storeInfo: storeDict[key] as! NSDictionary)
            storeList?.append(tempStore)
        }
        
    }
    func printStores() {
        for i in 0..<storeList!.count {
            storeList![i].printName()
        }
    }



    class Store {
        public private(set) var staff: [String]?
        public private(set) var email, address, name, storeImg, bio, storeImgPre, phoneNumber, googleRateLink : String?
        public private(set) var latitude, longitude, milesAway : Double?
        
        init(storeInfo: NSDictionary) {
            
            self.staff = storeInfo["staff"] as? [String] ?? [""]
            self.email = storeInfo["email"] as? String ?? "nil@gmail.com"
            self.address = storeInfo["address"] as? String ?? "address"
            self.name = storeInfo["name"] as? String ?? "Bandey Wireless"
            self.storeImg = storeInfo["storeImg"] as? String ?? "www.imgur.com"
            self.bio = storeInfo["bio"] as? String ?? "Store Biography"
            self.storeImgPre = storeInfo["storeImgPre"] as? String ?? "www.imgur.com"
            self.phoneNumber = storeInfo["phoneNumber"] as? String ?? "0000000000"
            self.googleRateLink = storeInfo["storeIngo"] as? String ?? "www.google.com"
            self.latitude = storeInfo["latitude"] as? Double ?? 0.0
            self.longitude = storeInfo["longitude"] as? Double ?? 0.0
            self.milesAway = 100.0
        }
        
        func printName() {
            print("Store Name: "+self.name!)
        }
    }
}
