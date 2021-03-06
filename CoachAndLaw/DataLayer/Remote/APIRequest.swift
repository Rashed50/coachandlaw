//
//  APIRequest.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 6/3/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit
import Alamofire



class APIRequest: NSObject {
 
  
    
 
    static let sharedInstance = APIRequest()
    
    
    typealias webServiceReponse = ([[String:Any]]?,Error?)-> Void
    
    func postRequest(_ url: String , parameters:[String:Any],completion:@escaping webServiceReponse) {
//        AF.request(url).validate().responseJSON {response in
//            if let error = response.error{
//
//                completion(nil,error)
//
//            }else if let jsonArray = response.result as? [[String:Any]]{
//                completion(jsonArray,nil)
//            }
//            }
        
        
        let login = ["CountryCode" : 1]

        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
                    
                    if let error = response.error{
                    
                                    completion(nil,error)
                    
                    }else if let jsonArray = response.result as? [[String:AFError]]{
                                    completion(jsonArray,nil)
                                }
            
        }
        
    }
    
    
    func getUniversities(countryCode:String,completion:@escaping ([Universty])->Void) { //,onFailure:@escaping(Error)->Void
        
      
       
      //  let param = ["countryCode": countryCode] as [String : Any]
        
        AF.request("https://httpbin.org/get").response { response in
            // print(response)
            completion( [Universty.init(dictionary:["UniversityId" : 1,"UniversityName" : "value","CountryCode" : "value","CountryState" : "value" as Any])]);
            
         }
    }
    func mentorSignUpRequest(params:[String:Any],completion:@escaping (String)->Void) { //,onFailure:@escaping(Error)->Void
          
          
          completion("success")
          AF.request("https://httpbin.org/get").response { response in
              // print(response)
            //  completion();
              
           }
        
      }
    
    func loginRequest(params:[String:Any],completion:@escaping (String)->Void) { //,onFailure:@escaping(Error)->Void
             
             
             completion("success")
             AF.request("https://httpbin.org/get").response { response in
                 // print(response)
               //  completion();
                 
              }
         }
    
    
   

// func getTeams (_ onSuccess: @escaping(Any) -> Void, onFailure: @escaping(Error) -> Void) {
//
//
//
//      if(error != nil){
//            onFailure(error!)
//        } else{
//            onSuccess(result)
//        }
//
//    }
 
}
