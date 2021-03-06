//
//  Service.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 6/3/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class Service: NSObject {
 
        
        var ServiceId : Int?
        var ServiceName : String?
        var ServiceTypeId : Int?
        
        init(dictionary:[String : AnyObject]) {
            self.ServiceId = (dictionary["ServiceId"] as! Int)
            self.ServiceName = (dictionary["ServiceName"] as! String)
            self.ServiceTypeId = (dictionary["ServiceTypeId"] as! Int)
        }
  
    
}
