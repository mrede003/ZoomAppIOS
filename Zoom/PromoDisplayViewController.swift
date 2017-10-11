//
//  PromoDisplayViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/25/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class PromoDisplayViewController: UIViewController {

    @IBOutlet weak var PromoImage: UIImageView!
    @IBOutlet weak var CallStoreButton: UIButton!
    @IBOutlet weak var PromoDescription: UILabel!
    @IBOutlet weak var ZoomLogoImage: CustomBorderUIImageView!
    @IBOutlet weak var VerizonLogoImage: CustomBorderUIImageView!
    
    var imageURL: URL?
    var promoDescriptionText: String?
    var storeList: Stores?
    var companyObj: Company?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorders()
        PromoImage.kf.setImage(with: imageURL)
        PromoDescription.text = promoDescriptionText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBorders() {
        PromoImage.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        PromoImage.layer.cornerRadius = 5.0
        PromoImage.layer.borderWidth = 3
        
        VerizonLogoImage.addBorder(edges: [.left, .top, .bottom], color: UIColor.black, thickness: 2)
        ZoomLogoImage.addBorder(edges: [.right, .top, .bottom], color: UIColor.black, thickness: 2)
        
        VerizonLogoImage.addBorder(edges: [.right], color: UIColor.black, thickness: 1)
        ZoomLogoImage.addBorder(edges: [.left], color: UIColor.black, thickness: 1)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PromoToLocations" {
            let secondController = segue.destination as! LocationTableViewController
            
            secondController.companyObj = companyObj
            secondController.storeList = storeList
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
