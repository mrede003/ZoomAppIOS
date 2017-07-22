//
//  Promo.swift
//  Zoom
//
//  Created by Matthew Redenius on 7/21/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import Foundation

struct Promo {
    let description : String?
    let expDate: String?
    let imgName: String?
    let name: String?
    let previewImg: String?
    let id: Int
    
    init(description: String, expDate: String, imgName: String, name: String, previewImg: String, id: Int)
    {
        self.description = description
        self.expDate = expDate
        self.imgName = imgName
        self.name = name
        self.previewImg = previewImg
        self.id = id
    }
}
