//
//  Universty.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 5/3/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class Universty: NSObject {
    
    var universityId : Int?
    var universityName : String = ""
    var countryState : String?
    var countryCode : String?
    
    init(dictionary:[String : Any]) {
        self.universityId = (dictionary["UniversityId"] as! Int)
        self.universityName = (dictionary["UniversityName"] as! String)
        self.countryCode = (dictionary["CountryCode"] as! String)
        self.countryState = (dictionary["CountryState"] as! String)
    }
  
}
