//
//  CountryTableTableViewController.swift
//  FootballApp
//
//  Created by 申婧雅 on 17/3/6.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import UIKit

class CountryTableTableViewController: UITableViewController {
    
    var peopleData : People!

    override func viewDidLoad() {
        super.viewDidLoad()

        peopleData = People(fromXML: "Barcelona.xml")
        
    
        
        self.title = "Country List"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peopleData.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countrycell", for: indexPath)
        
        let country = peopleData.getCountry(id: indexPath.row)
        cell.textLabel?.text = country.cname
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get indexPath for cell
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destination as! PeopleTableViewController
        
        // Push the selected object to the new view controller.
        destination.countryName = peopleData.getCountry(id: (indexPath?.row)!).cname
    }
 

}
