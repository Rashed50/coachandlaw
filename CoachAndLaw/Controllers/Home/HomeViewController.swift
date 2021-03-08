//
//  ViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 19/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let menteeTableCellID = "mentorTableCell"
    
    let mentorText = "mentor"
    let menteeText = "mentee"
    @IBOutlet weak var mentorViewContainer: UIView!
     @IBOutlet weak var menteeViewContainer: UIView!
     
    @IBOutlet weak var menteeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = Helper.getAppColor()
       // Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "")
        if(AppUserDefault.getMentorOrMentee() == menteeText){
            menteeViewContainer.isHidden = false
            mentorViewContainer.isHidden = true
            
          //  menteeTableView.register(UITableViewCell.self, forCellReuseIdentifier: menteeTableCellID)
            menteeTableView.delegate = self as UITableViewDelegate
            menteeTableView.dataSource = self as UITableViewDataSource
        }else {
            menteeViewContainer.isHidden = true
            mentorViewContainer.isHidden = false

        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          Helper.setNavigationBarProperty(navbar: self.navigationController, size: 18, title: "")
      }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
     // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return 20
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell :MentorTableViewCell = tableView.dequeueReusableCell(withIdentifier: menteeTableCellID) as! MentorTableViewCell
      //  let cell:MentorTableViewCell = (tableView.dequeueReusableCell(withIdentifier: menteeTableCellID) as! MentorTableViewCell?)!
        if(indexPath.row / 2 == 0){
            cell.nameLabel.text = "Rashedul Hoque"
            
        }
        cell.containerView.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }


}

