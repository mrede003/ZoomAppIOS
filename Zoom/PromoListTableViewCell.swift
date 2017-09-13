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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
