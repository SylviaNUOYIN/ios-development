//
//  historyViewController.swift
//  shoppingList
//
//  Created by 申婧雅 on 17/4/10.
//  Copyright © 2017年 JingyaShen. All rights reserved.
//

import UIKit
import CoreData

class historyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate  {
    

    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var historyTableView: UITableView!
    //@IBOutlet weak var listTableView: UITableViewCell!
    var history = [History]()
    var historyManagedObject:History! = nil
    
    
    // context, entity, fetchResultController
    let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult>! = nil
    
    
    func makeRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        let sorter = NSSortDescriptor(key:"name", ascending: true)
        request.sortDescriptors = [sorter]
        return request
    }
    
    
    override func viewDidLoad() {
        self.title = "History List"
        super.viewDidLoad()
        historyTableView.dataSource = self
        historyTableView.delegate = self
        
        historyTableView.reloadData()
        
        // Fetch data from data store
        fetchResultController = NSFetchedResultsController(fetchRequest: makeRequest(),managedObjectContext:context, sectionNameKeyPath:nil, cacheName: nil)
        
        fetchResultController.delegate = self
        
        do {try fetchResultController.performFetch()}
        catch{print("CoreData Error")}
        
        if let fetchedObjects = fetchResultController.fetchedObjects {
            history = fetchedObjects as! [History]
        }
        
       totalPriceLabel.text = "Total Price" + "$" + calTotalPrice(history)
        
        

    }
    
    func calTotalPrice(_ items:[History]) -> String {
        var sum:Double = 0.0
        
        for item in items {
            
            var price: Double!
            price = Double(item.price!)! * Double(item.number!)!
            sum += price
        }
        
        
        return String(sum)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        historyTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        if let fetchedObjects = controller.fetchedObjects {
            history = fetchedObjects as! [History]
        }
        
        totalPriceLabel.text = "Total Price" + "$"+calTotalPrice(history)
        
        
        historyTableView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return (fetchResultController.sections?.count)!
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return fetchResultController.sections! [section].numberOfObjects
        
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hCell", for: indexPath)
        
        //cell.delegate = self
        
        
        cell.textLabel?.text = history[indexPath.row].name
       cell.detailTextLabel?.text = "$:"+history[indexPath.row].price! + "Num: "+history[indexPath.row].number!
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
            context.delete(history[indexPath.row])
            do {try context.save()}
            catch {print("save error")}
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    
}
