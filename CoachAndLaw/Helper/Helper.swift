//
//  Helper.swift
//  Doc Scanner
//
//  Created by Rashed on 2017-01-19.
//  Copyright © 2017 iRLMobile. All rights reserved.
//

import UIKit
import MessageUI
 
 


let APP_HEXA_COlOR_CODE = "091B2C"
let APP_TEXT_HEXA_COlOR_CODE = "000000"
let APP_NAVIGATION_HEXA_COlOR_CODE = "2B2B2B"
let APP_NAVIGATION_TEXT_HEXA_COlOR_CODE = "ffffff"


let  APP_NAME  = "PDF Generator"
let DOWNLOAD_File_NAME  = "pdfgenerator"
let PDF_File_TYPE   = "pdf"
let MSWORD_File_TYPE   = "doc"
let MSWORD_File_TYPE10   = "docx"
let TEXT_File_TYPE   = "txt"
let MSEXCEL_File_TYPE   = "xls"
let MSEXCEL_File_TYPE10   = "xlsx"
let PNG_IMAGE_File_TYPE   = "png"
let JPG_IMAGE_File_TYPE   = "jpg"
let JPEG_IMAGE_File_TYPE   = "jpeg"
let GIF_IMAGE_File_TYPE   = "gif"

let directoryName : String = "AllDocuments"
let tempDirectoryName : String = "tempDocuments"
let tempOCRDirectoryName : String = "ocrTempDocuments"

@objc
class Helper: NSObject {
   
     
    
    
    
    static func showMessageView(title: String, message: String, view: UIViewController){
           
                       let alert = UIAlertController(title: title , message: message , preferredStyle: .alert)
                                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                                            
                                      }))
                       view.present(alert, animated: true, completion: nil)
           
       }
        
    
     
 
    
    
    
    
    static func getBasePath( basePath:String ) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory: AnyObject = paths[0] as AnyObject
        let dataPath = documentsDirectory.appending("/\(basePath)")
        return dataPath
    }
    
    
    //
    // MARK EMAIL FUNCTIONS WITH DELEGATE
    //
    
    static func sendEmail(viewCon:UIViewController, fileUrl: URL?,operationType:Int) {
           
           if MFMailComposeViewController.canSendMail() {
               
               let mail = MFMailComposeViewController()
               mail.mailComposeDelegate = viewCon as? MFMailComposeViewControllerDelegate
              
               if(operationType == 0){  // action sheet action
                   let attachmentData = NSData(contentsOfFile: fileUrl!.path)
                   let fileName : String = String(fileUrl!.absoluteString.split(separator: "/").last!)
                   let mimetype =  self.MimeTypefrom(filename: fileName)
                   mail.addAttachmentData(attachmentData! as Data, mimeType: mimetype, fileName: fileName)
                   mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
               }
               else if(operationType == 1) // user feedback and suggestion
               {
                   mail.setToRecipients(["asma084050@gmail.com"])
                   mail.title = "User Feedback and Suggestion"
                   mail.setMessageBody("<p>Your Feedback and Suggestions is Our Motivation</p>", isHTML: true)
               }
               else if(operationType == 2) // Tell A Friend to share this app
               {
                   
                   mail.title = "PDF Master"
                mail.setMessageBody("https://apps.apple.com/us/app/pdf-reader-edition-for-search-read-download-online-pdf-file/id1079022338", isHTML: true)
               }
               
               viewCon.present(mail, animated: true, completion: {
              
                   
               })
           } else {
                
           }
       }

    
       static func MimeTypefrom(filename:String)-> String{
           
           var mimeType : String = ""
           if ( filename == "jpg" ) {
               mimeType =  "image/jpeg"
           } else if (filename == "png" ) {
               mimeType = "image/png";
           } else if (filename == "doc" ) {
               mimeType = "application/msword";
           } else if (filename == "ppt" ) {
               mimeType = "application/vnd.ms-powerpoint";
           } else if (filename == "html" ) {
               mimeType =  "text/html"
           } else if (filename == "pdf" ) {
               mimeType = "application/pdf";
           }
           
           return mimeType
       }
       
       func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
           controller.dismiss(animated: true)
       }
    

       //
      // MARK: SET NAVIGATION BAR PROPERTY
      //
        @objc
       static func setNavigationBarProperty(navbar:UINavigationController!, size: Int ,title:String){
           
           let ssize  = CGFloat(size)
           let attrs = [
               NSAttributedString.Key.foregroundColor:getNavigationTextColor(),NSAttributedString.Key.font: UIFont(name:getAppTextFontName(), size:ssize)!
            ]
            if(navbar != nil){
                navbar.navigationBar.titleTextAttributes = attrs
                navbar.navigationBar.topItem?.title = title
                // navbar.navigationBar.backgroundColor = getNavigationColor()
                navbar.navigationBar.barTintColor = getNavigationColor()
            }
       }
       
  
    
    
    @objc static  func getNavigationColor() -> UIColor {

                  // Convert hex string to an integer
                  let hexint = Int(self.intFromHexString(hexStr: "000"))  //
                  let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
                  let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
                  let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
      
                  // Create color object, specifying alpha as well
                  let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
                  return color
              }
    @objc static  func getNavigationTextColor() -> UIColor {

                // Convert hex string to an integer
                let hexint = Int(self.intFromHexString(hexStr: "ffffff"))  //
                let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
                let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
                let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    
                // Create color object, specifying alpha as well
                let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
                return color
            }

      private static  func getHexaStringToColor(hexa: String) -> UIColor {

                   // Convert hex string to an integer
                   let hexint = Int(self.intFromHexString(hexStr: hexa))  //
                   let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
                   let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
                   let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
       
                   // Create color object, specifying alpha as well
                   let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
                   return color
               }
       
         @objc
         static  func getAppColor() -> UIColor {

                // Convert hex string to an integer
                let hexint = Int(self.intFromHexString(hexStr: APP_HEXA_COlOR_CODE))  //
                let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
                let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
                let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    
                // Create color object, specifying alpha as well
                let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
                return color
            }
         @objc
         static  func getTextColor() -> UIColor {

                   // Convert hex string to an integer
                   let hexint = Int(self.intFromHexString(hexStr: APP_TEXT_HEXA_COlOR_CODE))
                   let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
                   let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
                   let blue = CGFloat((hexint & 0xff) >> 0) / 255.0

                   // Create color object, specifying alpha as well
                   let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
                   return color
               }
         static func intFromHexString(hexStr: String) -> UInt32 {
                var hexInt: UInt32 = 0
                // Create scanner
                let scanner: Scanner = Scanner(string: hexStr)
                // Tell scanner to skip the # character
                scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
                // Scan hex value
                scanner.scanHexInt32(&hexInt)
                return hexInt
            }
       private static func getAppTextFontName()-> String{
           
           return "HelveticaNeue-Bold"
          //  return "MarkerFelt-Wide"
         // return  "Georgia-Bold"
       }
         
      static func getAppName()-> String{
             
             return "COACH & LAW"
         }
       @objc  static func SetButtonUIProperty(button: UIButton,title:String,fontSize:Float){
             
             let fontSize = CGFloat(fontSize)
             button.backgroundColor =  getAppColor()//  C80000
             if(title != ""){
                 button.setTitle(title, for: .normal)
             }
             button.setTitleColor(getTextColor(), for: .normal)
             button.titleLabel!.font = UIFont.init(name:getAppTextFontName()  , size:fontSize)
             button.layer.cornerRadius = 10
              
         }
    
    
    
     
    
    //
    // MARK: USER DEFAULT PREFERENCE
    //
      
      static func setDocumentDownloadClick(click:Bool){
          
            let defaults = UserDefaults.standard
            defaults.set(click, forKey: "downloadclick")
      }
      @objc
      static func getDocumentDownloadClick()->Bool{
                
             let defaults = UserDefaults.standard
             if (defaults.object(forKey: "downloadclick") != nil) {
                return defaults.bool(forKey:"downloadclick") as Bool
            }
            return false
      }
  
    
}

