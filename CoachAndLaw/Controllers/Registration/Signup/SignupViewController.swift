//
//  SignupViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 27/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController,SelectedDataDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {

    
    var selectedUniversity : String = ""
    var selectedService :String = ""
    var universityId = 1;
    var serviceId = 1
    let countryCode = "UK"
    
    @IBOutlet weak var appLogoImageView: UIImageView!
    
    @IBOutlet weak var mentorButton: UIButton!
    
    @IBOutlet weak var menteeButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var FirstNameText : UITextField!
     @IBOutlet weak var LastNameText : UITextField!
    @IBOutlet weak var emailText : UITextField!
    @IBOutlet weak var passwordText : UITextField!
    @IBOutlet weak var mobileText : UITextField!

  //  @IBOutlet weak var Text : UITextField!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    @IBOutlet weak var priceText : UITextField!
   // @IBOutlet weak var Text : UITextField!
    //@IBOutlet weak var Text : UITextField!
    
    @IBOutlet weak var priceView: UIView!
    
    @IBOutlet weak var descriptionCountLabel: UILabel!
    @IBOutlet weak var universityButton: UIButton!
    
    @IBOutlet weak var TypeOfLawButton: UIButton!
    
    @IBOutlet weak var checkTermConditionButton: UIButton!
    
    
    
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
         checkTermConditionButton.isSelected = true
        APIRequest.sharedInstance.getUniversities(countryCode: "BD"){ (universityList) in
            print(universityList[0].universityName)
        }
        descriptionTextView.delegate = self
        
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
    
    
    @IBAction func MentorButtonTap(_ sender: Any) {
         //  priceViewHeightContraint.constant = 50
        priceView.isHidden = false
        setMentorButtonUI()
        AppUserDefault.setMentorOrMentee("mentor")
          
      }
      
      
      @IBAction func MenteeButtonTap(_ sender: Any) {
        //  priceViewHeightContraint.constant = 0
         priceView.isHidden = true
        setMenteeButtonUI()
        AppUserDefault.setMentorOrMentee("mentee")
      
      }
    
    
    @IBAction func profilePhotoEditButtonTap(_ sender: Any) {
        openProfilePhotoActionSheet()
    }
    
    @IBAction func chooseUniversityButtonTab(_ sender: Any) {
        
        showModal(dataType: "universty")
     
    }
    
    @IBAction func ChooseLawTypeButtonTap(_ sender: Any) {
       showModal(dataType: "law")
    }
    
    
    @IBAction func termConditionCheckButtonTap(_ sender: Any) {
   
        if( checkTermConditionButton.isSelected) {
             checkTermConditionButton.isSelected = false
            checkTermConditionButton.setImage(UIImage.init(systemName: "square"), for: .normal)
        }else {
            checkTermConditionButton.isSelected = true
            checkTermConditionButton.setImage(UIImage.init(systemName: "checkmark.square"), for: .selected)
        }
    }
    
    @IBAction func signupButtonTap(_ sender: Any) {
        
        
        signUp()
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
    }
    
    
    
    /*
      ====================================================================================
      ============================ DELEGATE METHODS ===================================
      ====================================================================================
     */
    
    // MARK: DELEGATE METHODS
    
    func selectedRowData(currName: String,dataType:String){
        
          if(dataType == "law"){
            selectedService = currName
            TypeOfLawButton.setTitle(selectedService, for: .normal)
        
           }
        else{
          selectedUniversity = currName
          universityButton.setTitle(selectedUniversity, for: .normal)
        }
    }
      // MARK: IMAGE PICKER DELEGATE METHODS
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let selectedImage  = info[.originalImage] as? UIImage
        profileImageView.image = selectedImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
  // MARK: TEXTVIEW DELEGATE METHODS
    func textViewDidBeginEditing(_ textView: UITextView) {
         if(textView.text == "Description")
         {textView.text = ""}
         else if(textView.text == ""){
            textView.text = "Description"
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        
        let newLength = textView.text.count
        descriptionCountLabel.text = "\(newLength)/320"
    }
    func textViewDidEndEditing(_ textView: UITextView) {
       let newLength = textView.text.count
      descriptionCountLabel.text = "\(newLength)/320"
        
    }
    
    
    /*
      ====================================================================================
      ============================ USER DEFINE METHODS ===================================
      ====================================================================================
     */
    
    // MARK:  USER_DEFINE_METHOD
    
    func openProfilePhotoActionSheet() {
      let alert =  UIAlertController.init(title: "Choose Options", message: "Edit Profile Image", preferredStyle: .actionSheet)
        let cameraButton = UIAlertAction.init(title: "Camera", style: .default, handler: { (alert : UIAlertAction) in
            self.openGalleryOrCamera(isGallery: false)
        })
        let galleryButton = UIAlertAction.init(title: "Gallery", style: .default, handler: { (alert : UIAlertAction) in
            self.openGalleryOrCamera(isGallery: true)
        })
        let cancelButton = UIAlertAction.init(title: "Cancel", style: .cancel, handler: { (alert : UIAlertAction) in
            
        })
        
        alert.addAction(cameraButton)
        alert.addAction(galleryButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
        
    }
    func openGalleryOrCamera(isGallery:Bool) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = isGallery ?  UIImagePickerController.SourceType.photoLibrary : UIImagePickerController.SourceType.camera
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
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
          initialViewController.delegate = self;
          initialViewController.infoType = dataType
          // self.navigationController?.pushViewController(initialViewController, animated: true)
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
    
    
    func gotoTabbarUI(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartupViewController")
         let initialViewController = storyboard.instantiateViewController(withIdentifier: "TabbarController")
         appDelegate.window?.rootViewController = initialViewController
         appDelegate.window?.makeKeyAndVisible()
    }
    
    func signUp() {
        let fname  = FirstNameText.text
        let lname = LastNameText.text
        let email = emailText.text
        let mobile = mobileText.text
        let subPrice = priceText.text
        let password = passwordText.text
        let description = descriptionTextView.text
        let profileImage = profileImageView.image
        let params = [
                    "FirstName": fname ?? "",
                    "MiddleName":  "",
                    "LastName": lname ?? "",
                    "Email": email ?? "",
                    "ProfileDescription": fname ?? "",
                    "MobileNo": mobile,
                    "Photo": profileImage ?? "",
                    "CVPath": "",
                    "CountryCode": countryCode ?? "",
                    "Address": "",
                    "HiringPrice": 40,
                    "Rating": 0,
                    "IsAvailableToHire": 1,
                    "NoOfHourFoMentee" : 40,
                    "TotalEarn" : 0,
                    "TotalWithdraw" : 0,
                    "UniversityId" : universityId,
                    "ServiceId" : serviceId
                   ] as [String : Any]
        
        
        /*
         
         [MentorId] [int]  NOT NULL PRIMARY KEY IDENTITY(1,1),
                     [FirstName] [nvarchar](20) NOT NULL,
                     [MiddleName] [nvarchar](20) NOT NULL,
                     [LastName] [nvarchar](20) NOT NULL,
                     [Email] [nvarchar](50) NOT NULL,
                     [ProfileDescription] [nvarchar](400)  NULL,
                     [MobileNo] [nvarchar](15) NOT NULL,
                     [Photo] [nvarchar](100)  NULL,
                     [CVPath] [nvarchar](100)  NULL,
                     [CountryCode] [nvarchar](20)  NULL,
                     [Address] [nvarchar](100)  NULL,
                     [HiringPrice] [float] default 40,
                     [Rating] [float] default 0,
                     [IsAvailableToHire]  [int] default 1,
                     [NoOfHourFoMentee]  [int] default 20,
                     [TotalEarn] [int]  default 0,
                     [TotalWithdraw] [int]  default 0,
                     [UniversityId] [int]  NOT NULL,
                     [ServiceId] [int]  NOT NULL,
         */
        
        
        APIRequest.sharedInstance.mentorSignUpRequest(params: params, completion: {(Result) in
            print("Signup Completed")
          //  MakeToast.shared.makeNormalSuccessAlert("Sucess", viewController: self)
            self.gotoTabbarUI()
        })
        
        
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
