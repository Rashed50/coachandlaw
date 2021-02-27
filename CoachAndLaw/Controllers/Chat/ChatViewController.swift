//
//  ChatViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Helper.getAppColor()
         Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "Messaging")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setNeedsStatusBarAppearanceUpdate()
       
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
