//
//  StartupViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 20/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {
   var counter = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = Helper.getAppColor()
         Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }



    @objc func updateCounter() {
        
        if counter > 0 {
            print("\(counter) seconds to the end of the world")
            counter -= 1
        }
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
