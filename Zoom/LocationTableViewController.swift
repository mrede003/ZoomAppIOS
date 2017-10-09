//
//  LocationTableViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 10/8/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {

    var storeList: Stores?
    var companyInfo: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (storeList?.storeList?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LocationTableCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! LocationTableCell
        
        let currentStore = storeList?.storeList?[indexPath.row]
        cell.storeNameLabel.text = currentStore?.name
        cell.storeAddressLabel.text = currentStore?.address
        let url = URL(string: (currentStore?.storeImgPre)!)
        cell.locationImage.kf.setImage(with: url)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LocationListToLocationDisplay" {
            let secondController = segue.destination as! LocationViewController
            let selectedIndex = tableView.indexPathForSelectedRow?.row
            let currentStore = storeList?.storeList?[selectedIndex!]
            
            secondController.imageURL = URL(string: (currentStore?.storeImg)!)
            secondController.storeBioText = currentStore?.bio
            secondController.storeAddressText = currentStore?.address
            secondController.title = currentStore?.name
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
