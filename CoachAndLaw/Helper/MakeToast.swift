//
//  MakeToast.swift
//  E-Buy
//
//  Created by Mohaimin Fahad on 12/27/19.
//  Copyright © 2019 SETUPTECH. All rights reserved.
//

import Foundation
import Toast_Swift

class MakeToast{
    
    static let shared = MakeToast()
    
    func makeNormalToast(_ message:String){
        
        UIApplication.shared.keyWindow?.hideAllToasts()
        UIApplication.shared.keyWindow?.makeToast(message, duration: 3, position: .bottom)
    }

    func makeWhiteToast(_ message:String){
        UIApplication.shared.keyWindow?.hideAllToasts()
        var style = ToastStyle()
        style.messageColor = .black
        style.backgroundColor = .white
        style.cornerRadius = 20
        UIApplication.shared.keyWindow?.makeToast(message, duration: 2, position: .bottom, style: style)
    }
    
    func makeCustomToast(_ message:String){
         UIApplication.shared.keyWindow?.hideAllToasts()
         var style = ToastStyle()
         style.messageColor = .white
        // style.backgroundColor = UIColor(hex: "D18306", alpha: 1)
         style.cornerRadius = 5
         UIApplication.shared.keyWindow?.makeToast(message, duration: 3, position: .bottom, style: style)
     }
    
    func makeNormalSuccessAlert(_ message: String, viewController: UIViewController){
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func makeNormalErrorAlert(_ message: String, viewController: UIViewController){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
}

