//
//  ChatTableViewController.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 27/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit


@objc protocol SelectedDataDelegate {
    func selectedRowData(currName: String,dataType:String)
}
  
class UniversityTableViewController: UITableViewController {

    var infoType:String = ""
    var universityLit = [String]()
    
    weak var delegate: SelectedDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        
       self.view.backgroundColor = Helper.getAppColor()
        loadTableData()
        
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
               return .lightContent
           }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return universityLit.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let label:UILabel = cell.viewWithTag(10) as! UILabel
       // label.text = "University Name is \(indexPath.row) "
        label.text = universityLit[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("You selected cell #\(indexPath.row)!")
         //   let cell = tableView.cellForRow(at: indexPath as IndexPath)
            
            delegate?.selectedRowData(currName: universityLit[indexPath.row],dataType:infoType)
            dismiss(animated: true, completion: nil)
    }
    
  

     
    
    
    func loadTableData() {
        if(infoType == "law"){
            
            universityLit = [
                           "Administrative Law",
                             "Constitutional Law",
                               "Tort Law",
                                 "Public Law",
                                   "Land Law",
                                     "EU Law",
                                      "Equity & Trusts Law",
                                       "Criminal Law",
                                         "Contract Law",
                                           "FinTech Law",
                                        "Art Law",
                                    "Energy Law",
                                "Mergers & Acquisitions Law",
                            "Real Estate Law",
                            
                       ]
            
        }else {
            universityLit = [
                "Angila Ruskin University",
                "Both Spa University",
                "Birkbeck University of London",
                "Birmingham City University",
                "Cardiff University",
                "Cardiff Metropolitan University",
                "City University London",
                "Coventry University",
                "De Montfift University",
                "Durham University",
                "Glasgow Celedonian University",
                "Goldsmiths University of London",
                "Heriot Watt University",
                "Institute Marangoni University",
                "Keele University",
                "Kingston University",
                "Lancaster University",
                "Leeds Beckett University",
            ]
        }
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
