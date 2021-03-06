//
//  RegistrationViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 20/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class RegistrationViewController: UIViewController {

    
    
    @IBOutlet weak var VideoPlayerView: VideoView!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
          self.view.backgroundColor = Helper.getAppColor()
       // let videoUrl = "https://www.starhairbd.com/video/login_bg_video.mp4"
        let videoUrl = "https://www.starhairbd.com/video/third_hd.mp4"
        
      //  let videoUrl = "https://www.starhairbd.com/video/myvideo.mp4"
        VideoPlayerView.configure(url: videoUrl)
        VideoPlayerView.isLoop = true
        VideoPlayerView.play()
        
        
         
        
        SignUpButton.layer.cornerRadius = 10;
        SignUpButton.clipsToBounds = true
        
        LoginButton.layer.cornerRadius = 10;
        LoginButton.clipsToBounds = true

       // Play()
         
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
     }
 
   
 
    @IBAction func LoginButtonAction(_ sender: Any) {
        
                  let storyboard = UIStoryboard(name: "Registration", bundle: nil) //
                  let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                  self.navigationController?.pushViewController(initialViewController, animated: true)
              
    }
    
    
    @IBAction func SignupButtonAction(_ sender: Any) {
        
         
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
      //  let initialViewController = storyboard.instantiateViewController(withIdentifier: "signupViewController")
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "signupViewController") as! SignupViewController
        if(self.navigationController == nil){
            print("nav error")
            return
        }
        self.navigationController?.pushViewController(initialViewController, animated: true)
      }
    
    
    
    
}
