//
//  SignupViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 27/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    
    @IBOutlet weak var mentorButton: UIButton!
    
    @IBOutlet weak var menteeButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var priceViewHeightContraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        appLogoImageView.layer.cornerRadius = 15
         appLogoImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        menteeButton.layer.cornerRadius = 5
        mentorButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 10
        descriptionTextView.layer.cornerRadius = 10
         setMentorButtonUI()
         
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    
           Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "SIGN UP")
           setNavigationCustomBackButton()
        
        }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

   
    
    /*
      ====================================================================================
      ============================ BUTTON ON TAP METHODS ===================================
      ====================================================================================
     */
    
    // MARK: BUTTON_ON_TAP_METHODS
    
    @IBAction func chooseUniversityButtonTab(_ sender: Any) {
        
        showModal(dataType: "universty")
     
    }
    
    @IBAction func ChooseLawTypeButtonTap(_ sender: Any) {
       showModal(dataType: "law")
    }
    
    
    
    
    @IBAction func MentorButtonTap(_ sender: Any) {
         priceViewHeightContraint.constant = 50
         setMentorButtonUI()
    
        
    }
    
    
    @IBAction func MenteeButtonTap(_ sender: Any) {
        priceViewHeightContraint.constant = 0
        setMenteeButtonUI()
        
    }
    
    
    
    
    /*
      ====================================================================================
      ============================ USER DEFINE METHODS ===================================
      ====================================================================================
     */
    
    // MARK:  USER_DEFINE_METHOD
    
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
       
       func showModal(dataType:String) {
              let storyboard = UIStoryboard(name: "Registration", bundle: nil)
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "universityTableViewController") as! UniversityTableViewController
           
          initialViewController.infoType = dataType
         //  self.navigationController?.pushViewController(initialViewController, animated: true)
         //  initialViewController.modalPresentationStyle = .overCurrentContext
             present(initialViewController, animated: true, completion: nil)
       }
    
    func setMentorButtonUI() {
         mentorButton.backgroundColor = UIColor.black
             mentorButton.setTitleColor(UIColor.white, for: .normal)
             
             menteeButton.backgroundColor = UIColor.lightGray
             menteeButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func setMenteeButtonUI() {
            menteeButton.backgroundColor = UIColor.black
                    menteeButton.setTitleColor(UIColor.white, for: .normal)
                   
                   mentorButton.backgroundColor = UIColor.lightGray
                   mentorButton.setTitleColor(UIColor.black, for: .normal)
       }
    
    
    
    
    
    
}


extension UIView{

      // OUTPUT 1
  

      // OUTPUT 2
      func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
  
}
