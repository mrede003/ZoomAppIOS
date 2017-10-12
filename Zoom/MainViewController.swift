//
//  MainViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/7/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var companyObj: Company?
    var promoList: Promos?
    var storeList: Stores?
    

    @IBAction func openWebpageButton(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: (companyObj?.website_url)!)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyObj?.printName()
        promoList?.printPromos()
        storeList?.printStores()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToPromoTableSeque" {
            
            let secondController = segue.destination as! PromoTableViewController
            secondController.promoList = self.promoList
            secondController.storeList = self.storeList
            secondController.companyObj = self.companyObj
            
        } else if segue.identifier == "MaintoLocations" {
            
            let secondController = segue.destination as! LocationTableViewController
            secondController.companyObj = self.companyObj
            secondController.storeList = self.storeList
            
        } else if segue.identifier == "MainToSocialMedia" {
            
            let secondController = segue.destination as! SocialMediaTableViewController
            secondController.companyObj = self.companyObj
            
        } else if segue.identifier == "MainToAppointment" {
            
            let secondController = segue.destination as! AppointmentController
            secondController.companyObj = self.companyObj
            secondController.storeList = self.storeList
            
        }
        
    }
}
