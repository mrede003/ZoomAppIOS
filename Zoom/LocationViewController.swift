//
//  LocationViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 10/8/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit
import MapKit

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
    
    @IBAction func navigateToStore(_ sender: UIButton) {
        let latitude: CLLocationDegrees = (store?.latitude)!
        let longitude: CLLocationDegrees = (store?.longitude)!
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = store?.name
        mapItem.openInMaps(launchOptions: options)
    }
    
    @IBAction func callStore(_ sender: UIButton) {
        let phone = store?.phoneNumber
        if let url = URL(string: "tel://\(phone ?? "7574811800")!"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func openRatingLink(_ sender: UIButton) {
        print(store?.googleRateLink)
        UIApplication.shared.openURL(URL(string: (store?.googleRateLink)!)!)
    }
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
