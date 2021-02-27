//
//  AppDelegate.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
       
    var isRegistrationDone = 0
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
       
        
        if(isRegistrationDone == 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
           // let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartupViewController")
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "TabbarController")
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        }else if(isRegistrationDone == 0){

            let storyboard = UIStoryboard(name: "Registration", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController")
            let nav = UINavigationController.init(rootViewController: initialViewController)
             
          //  let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
        }
          
        return true
    }
    
    func statusBarColorChange(){

        if #available(iOS 13.0, *) {

                let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = UIColor.red
                statusBar.tag = 100
                UIApplication.shared.keyWindow?.addSubview(statusBar)

        } else {

                let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.yellow

            }
    }

    


}

/*
 
 <key>UIApplicationSceneManifest</key>
 <dict>
     <key>UIApplicationSupportsMultipleScenes</key>
     <false/>
     <key>UISceneConfigurations</key>
     <dict>
         <key>UIWindowSceneSessionRoleApplication</key>
         <array>
             <dict>
                 <key>UISceneConfigurationName</key>
                 <string>Default Configuration</string>
                 <key>UISceneDelegateClassName</key>
                 <string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
                 <key>UISceneStoryboardFile</key>
                 <string>Main</string>
             </dict>
         </array>
     </dict>
 </dict>
 */
 
