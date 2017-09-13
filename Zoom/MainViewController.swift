//
//  MainViewController.swift
//  Zoom
//
//  Created by Matthew Redenius on 9/7/17.
//  Copyright © 2017 Matt Redenius. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var ButtonBarStackView: UIStackView!
    @IBOutlet weak var HorizontalButtonView: UIStackView!
    @IBOutlet weak var HorizontalLabelView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The view did load")
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
