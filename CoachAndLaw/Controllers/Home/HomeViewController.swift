//
//  ViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let mentorText = "mentor"
    let menteeText = "mentee"
    @IBOutlet weak var mentorViewContainer: UIView!
     @IBOutlet weak var menteeViewContainer: UIView!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = Helper.getAppColor()
        if(AppUserDefault.getMentorOrMentee() == menteeText){
            menteeViewContainer.isHidden = false
            mentorViewContainer.isHidden = true
        }else {
            menteeViewContainer.isHidden = true
            mentorViewContainer.isHidden = false
        }
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        //  Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "Settings")
      }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

