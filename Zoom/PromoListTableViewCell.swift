//
//  PromoListTableViewCell.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/12/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class PromoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var promoDescription: UILabel!
    @IBOutlet weak var promoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        promoPreviewImage.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        promoPreviewImage.layer.cornerRadius = 5.0
        promoPreviewImage.layer.borderWidth = 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
