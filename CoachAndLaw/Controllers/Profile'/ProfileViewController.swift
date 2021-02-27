//
//  ProfileViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var updateDescriptionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     self.view.backgroundColor = Helper.getAppColor()
        updateDescriptionButton.layer.cornerRadius = 10
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
     }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
