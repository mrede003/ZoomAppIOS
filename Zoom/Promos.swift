//  Promos.swift
//  Zoom
//
//  Created by Matthew Redenius on 7/21/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation

class Promos {
    
    public private(set) var promoList : [Promo]?
    
    init(promoArray: [NSDictionary]) {
        promoList = [Promo]()
        var count = 0
        for info in promoArray {
            let tempPromo = Promo(info: info)
            tempPromo.id = count
            count+=1
            promoList?.append(tempPromo)
        }
    }
    func printPromos() {
        for i in 0..<promoList!.count {
            promoList![i].printName()
        }
    }
    
    
    
    
    
    //Data object that holds promo information
    class Promo {
        public private(set) var description : String?
        public private(set) var expDate: String?
        public private(set) var imgName: String?
        public private(set) var name: String?
        public private(set) var previewImg: String?
        public var id: Int?
    
        init(info: NSDictionary) {
            
            self.description = info["description"] as? String ?? "Description"
            self.expDate = info["expDate"] as? String ?? "TBA"
            self.imgName = info["imgName"] as? String ?? "www.imgur.com"
            self.name = info["name"] as? String ?? "Promo Name"
            self.previewImg = info["previewImg"] as? String ?? "www.imgur.com"
        }
        func printName() {
            print("Promo Name \(self.name!)")
        }
    }
}
