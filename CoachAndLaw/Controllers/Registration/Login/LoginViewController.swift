//
//  LoginViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 21/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginInfoView: UIView!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "LOG IN")
        setNavigationCustomBackButton()
        self.view.backgroundColor = Helper.getAppColor()
        loginInfoView.layer.cornerRadius = 10
        loginInfoView.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
    }
    
 
    @IBAction func LoginButtonTap(_ sender: Any) {
        gotoNextView()
    }
    
    func gotoNextView(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartupViewController")
         let initialViewController = storyboard.instantiateViewController(withIdentifier: "TabbarController")
         appDelegate.window?.rootViewController = initialViewController
         appDelegate.window?.makeKeyAndVisible()
    }
    
       func setNavigationCustomBackButton(){
           
           let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
           button.setImage(UIImage(named: "back-arrow"), for: .normal)
           button.showsTouchWhenHighlighted = true
           button.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
           self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
    
          
          }
       
       @objc func backToMain() {
           self.navigationController?.popViewController(animated: true)
       }

}
