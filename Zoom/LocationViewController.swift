//
//  LocationViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 10/8/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    var companyObj: Company?
    var store: Stores.Store?
    var imageURL: URL?
    var storeBioText: String?
    var storeAddressText: String?
    
    @IBOutlet weak var StoreImage: UIImageView!
    @IBOutlet weak var StoreBio: UILabel!
    @IBOutlet weak var StoreAddress: UILabel!
    
    @IBOutlet weak var BottomUIView: CustomBorderUIView!
    @IBOutlet weak var MiddleUIView: CustomBorderUIView!
    @IBOutlet weak var TopUIView: CustomBorderUIView!
    @IBOutlet weak var VerizonLogoImageView: CustomBorderUIImageView!
    @IBOutlet weak var ZoomLogoImageView: CustomBorderUIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StoreBio.text = storeBioText!
        StoreAddress.text = storeAddressText!
        StoreImage.kf.setImage(with: imageURL)
        
        setBorders()
    }
    
    func setBorders() {
        VerizonLogoImageView.addBorder(edges: [.bottom], color: UIColor.black, thickness: 2)
        VerizonLogoImageView.addBorder(edges: [.right], color: UIColor.black, thickness: 1)
        
        ZoomLogoImageView.addBorder(edges: [.bottom], color: UIColor.black, thickness: 2)
        ZoomLogoImageView.addBorder(edges: [.left], color: UIColor.black, thickness: 1)

        TopUIView.addBorder(edges: [.left, .top, .bottom, .right], color: UIColor.black, thickness: 2)
        MiddleUIView.addBorder(edges: [.left, .top, .bottom, .right], color: UIColor.black, thickness: 2)
        BottomUIView.addBorder(edges: [.left, .top, .bottom, .right], color: UIColor.black, thickness: 2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
