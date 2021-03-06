//
//  WordSearchUserDefault.swift
//  CryptWallet
//
//  Created by ITECH SOFT on 12/06/20.
//  Copyright © 2020 ITECH SOFT. All rights reserved.
//

import Foundation

class AppUserDefault {
    
    
    class func getMentorOrMentee()-> String?{
          return UserDefaults.standard.string(forKey: "mentor-mentee")
      }
      
      class func setMentorOrMentee(_ info: String) {
          UserDefaults.standard.set(info, forKey: "mentor-mentee")
          UserDefaults.standard.synchronize()
      }
    
    class func getFirstName()-> String?{
          return UserDefaults.standard.string(forKey: "first-name")
      }
      
      class func setFirstName(_ name: String) {
          UserDefaults.standard.set(name, forKey: "first-name")
          UserDefaults.standard.synchronize()
      }
    
     
       class func getLastName()-> String?{
             return UserDefaults.standard.string(forKey: "last-name")
         }
         
         class func setlastName(_ name: String) {
             UserDefaults.standard.set(name, forKey: "last-name")
             UserDefaults.standard.synchronize()
         }
    
    
    
    
    
    
    //access-token
    class func getAccessToken()-> String?{
        return UserDefaults.standard.string(forKey: "access-token")
    }
    
    class func setAccessToken(_ phone: String) {
        UserDefaults.standard.set(phone, forKey: "access-token")
        UserDefaults.standard.synchronize()
    }
    
    
    //phone
    class func getPhone()-> String?{
        return UserDefaults.standard.string(forKey: "phone")
    }
    
    class func setPhone(_ phone: String) {
        UserDefaults.standard.set(phone, forKey: "phone")
        UserDefaults.standard.synchronize()
    }
    
    //id
    class func getUserID()-> String?{
        return UserDefaults.standard.string(forKey: "user_id")
    }
    
    class func setUserID(_ userID: String) {
        UserDefaults.standard.set(userID, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }
    
    //is logged in
    class func getSocialLoggedIn()-> Bool{
        return UserDefaults.standard.bool(forKey: "social_logged_in")
    }
    
    class func setSocialIsLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: "social_logged_in")
        UserDefaults.standard.synchronize()
    }
    
    
    //is logged in
    class func getIsLoggedIn()-> Bool{
        return UserDefaults.standard.bool(forKey: "logged_in")
    }
    
    class func setIsLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: "logged_in")
        UserDefaults.standard.synchronize()
    }
    
    //Quiz Sound
    
    class func getSoundOn()-> Bool{
        return UserDefaults.standard.bool(forKey: "sound_on")
    }
    
    class func setSoundOn(_ soundOn: Bool) {
        UserDefaults.standard.set(soundOn, forKey: "sound_on")
        UserDefaults.standard.synchronize()
    }
    
    //is First Time
    class func getIsFirstTime()-> Bool{
         return UserDefaults.standard.bool(forKey: "first_time")
     }
     
     class func setIsFirstTime(_ isFirstTime: Bool) {
         UserDefaults.standard.set(isFirstTime, forKey: "first_time")
         UserDefaults.standard.synchronize()
     }
    
    
    
    // first_name
     class func getUserName()-> String?{
         return UserDefaults.standard.string(forKey: "user_name")
     }
     
     class func setUserName(_ userName: String) {
         UserDefaults.standard.set(userName, forKey: "user_name")
         UserDefaults.standard.synchronize()
     }
    
    
    //email
    class func getEmail()-> String?{
        return UserDefaults.standard.string(forKey: "email")
    }
    
    class func setEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.synchronize()
    }
    
    
    //password
    class func getPassword()-> String?{
        return UserDefaults.standard.string(forKey: "password")
    }
    
    class func setPassword(_ password: String) {
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
    
    //DOB
    class func getDOB()-> String?{
        return UserDefaults.standard.string(forKey: "date_of_birth")
    }
    
    class func setDOB(_ DOB: String) {
        UserDefaults.standard.set(DOB, forKey: "date_of_birth")
        UserDefaults.standard.synchronize()
    }
    
    //Gender
    class func getGender()-> String?{
        return UserDefaults.standard.string(forKey: "gender")
    }
    
    class func setGender(_ gender: String) {
        UserDefaults.standard.set(gender, forKey: "gender")
        UserDefaults.standard.synchronize()
    }
    /*
    //club adress
    class func getClubAdress()-> [String]?{
        return UserDefaults.standard.object(forKey: "club_address") as? [String]
    }
    
    class func setClubAdress(_ adresses: [String]) {
        UserDefaults.standard.set(adresses, forKey: "club_address")
        UserDefaults.standard.synchronize()
    }
    
    //Official Level
    class func getAbout()-> String?{
        return UserDefaults.standard.string(forKey: "about")
    }
    
    class func setAbout(_ text: String) {
        UserDefaults.standard.set(text, forKey: "about")
        UserDefaults.standard.synchronize()
    }
    
    //Official Level
    class func getOfficialLevel()-> String?{
        return UserDefaults.standard.string(forKey: "official_level")
    }
    
    class func setOfficialLevel(_ level: String) {
        UserDefaults.standard.set(level, forKey: "official_level")
        UserDefaults.standard.synchronize()
    }
    
    //Estimated Level
    class func getEstimatedLevel()-> String?{
        return UserDefaults.standard.string(forKey: "estimated_level")
    }
    
    class func setEstimatedLevel(_ level: String) {
        UserDefaults.standard.set(level, forKey: "estimated_level")
        UserDefaults.standard.synchronize()
    }
    
    //Best Level
    class func getBestLevel()-> String?{
        return UserDefaults.standard.string(forKey: "best_level")
    }
    
    class func setBestLevel(_ level: String) {
        UserDefaults.standard.set(level, forKey: "best_level")
        UserDefaults.standard.synchronize()
    }
    
    //Style
    class func getStyle()-> String?{
        return UserDefaults.standard.string(forKey: "style")
    }
    
    class func setStyle(_ style: String) {
        UserDefaults.standard.set(style, forKey: "style")
        UserDefaults.standard.synchronize()
    }
    
    //Position
    class func getPosition()-> String?{
        return UserDefaults.standard.string(forKey: "position")
    }
    
    class func setPosition(_ position: String) {
        UserDefaults.standard.set(position, forKey: "position")
        UserDefaults.standard.synchronize()
    }
    */
    //Image
    class func getImageURL()-> String?{
        return UserDefaults.standard.string(forKey: "image_url")
    }
    
    class func setImageURL(_ url: String) {
        UserDefaults.standard.set(url, forKey: "image_url")
        UserDefaults.standard.synchronize()
    }
    
    //push_token
    class func getPushToken()-> String?{
        return UserDefaults.standard.string(forKey: "push_token")
    }
    
    class func setPushToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "push_token")
        UserDefaults.standard.synchronize()
    }
    
    //last_address
    class func getLastAddress()-> [String: Any]?{
        return UserDefaults.standard.object(forKey: "last_address") as? [String : Any]
    }
    
    class func setLastAddress(_ addressObj: [String: Any]) {
        UserDefaults.standard.set(addressObj, forKey: "last_address")
        UserDefaults.standard.synchronize()
    }
}
