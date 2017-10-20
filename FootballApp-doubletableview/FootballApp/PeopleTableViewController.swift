//
//  PeopleTableViewController.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/14.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    // table data
    
    var countryName : String!
    var countryData : Country!
    
    //let section = ["Germany","Spain","Croatia","Turkey","Uruguay","Argentina","Brazil","Netherlands","France"]
    var items = [Person]()
    //var items = [["Marc-Andre ter Stegen"],["Gerard Pique","Sergio Busquets","Denis Suarez","Andres Iniesta","Paco Alcacer","Jordi Alba","Sergi Roberto"],["Ivan Rakitic"],["Arda Turan"],["Luis Suarez"],["Lionel Messi","Javier Mascherano"],["Neymar","Rafinha"],["Jasper Cillessen"],["Lucas Digne"]]


    override func viewDidLoad() {
        super.viewDidLoad()

        
        countryData = Country(fromXML: "Barcelona.xml")
        
        
        for i in 0 ..< countryData.getCount() {
            if countryName == countryData.data[i].cname {
                items.append(countryData.data[i])
            }
        }
        
        self.title = "Team Member"
        
        

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
    
    //override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return self.section[section]
    //}


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell with Person data
        
        let person = items[indexPath.row]
        
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.number
        cell.imageView?.image = UIImage(named: person.image)

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
        if segue.identifier == "secondSegue" {
        // get indexPath for cell
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destination as! ViewController
        
        // Push the selected object to the new view controller.
        destination.personData = items[(indexPath?.row)!]
        //destination.personData = countryData.getPerson(id: (indexPath?.row)!)
    }
    }
    

}
