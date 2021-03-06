//
//  AuthenticationController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 6/3/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit
import Alamofire

class AuthenticationController: NSObject {

    public func signUp(){
        AF.request("https://httpbin.org/get").response { response in
            print(response)
        }
    }
}
