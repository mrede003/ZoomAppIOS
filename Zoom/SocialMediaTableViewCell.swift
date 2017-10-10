//
//  SocialMediaTableViewCell.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/19/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class SocialMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
