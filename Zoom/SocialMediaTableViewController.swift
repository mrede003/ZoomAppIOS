//
//  SocialMediaTableViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 10/9/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class SocialMediaTableViewController: UITableViewController {

    var companyObj : Company?
    let facebook = 0
    let twitter = 1
    let google_plus = 2
    let instagram = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SocialMediaTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SocialMediaTableViewCell
        
        switch indexPath.row {
        case facebook:
            cell.icon.image = #imageLiteral(resourceName: "facebook")
        case twitter:
            cell.icon.image = #imageLiteral(resourceName: "twitter")
            cell.title.text = "Twitter"
            cell.body.text = "Tweet us your experience, bad or good, we embrace our customers feedback!"
        case google_plus:
            cell.icon.image = #imageLiteral(resourceName: "googleplus")
            cell.title.text = "Google Plus"
            cell.body.text = "Join our circle and become a part of the Zoom Family. Drop a review and let us know how we're doing!"
        case instagram:
            cell.icon.image = #imageLiteral(resourceName: "instagram")
            cell.title.text = "Instagram"
            cell.body.text = "Take a photo and share! We love seeing picture of our satisfied customers!"
        default:
            break
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch tableView.indexPathForSelectedRow!.row {
        case facebook:
            break
        case twitter:
            break
        case google_plus:
            break
        case instagram:
            break
        default:
            break
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
