//
//  LocationTableCell.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/17/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class LocationTableCell: UITableViewCell {

    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeAddressLabel: UILabel!
    @IBOutlet weak var milesAwayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
