//
//  SettingViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    self.view.backgroundColor = Helper.getAppColor()
        // Do any additional setup after loading the view.
        setNeedsStatusBarAppearanceUpdate()
       }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        if(self.navigationController == nil)
        { print("error")
        }
            Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "Settings")
           // self.title = "Settings"
        }
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
              return .lightContent
        }

}
