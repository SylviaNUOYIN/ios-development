//
//  listViewController.swift
//  shoppingList
//
//  Created by 申婧雅 on 17/4/10.
//  Copyright © 2017年 JingyaShen. All rights reserved.
//

import UIKit
import CoreData

class listViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, listCellDelegate{
    
    

    
    @IBOutlet weak var listTableView: UITableView!
    //@IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
       //}
    
    // array for itemManageObjects
    var item:[Item] = []
    
    
    // context, entity, fetchResultController
    let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult>! = nil
    
    var itemManagedObject:Item! = nil
    var historyManagedObject:History! = nil
    func makeRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let sorter = NSSortDescriptor(key:"name", ascending: true)
        request.sortDescriptors = [sorter]
        return request
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.title = "Shopping List"
        listTableView.delegate = self
        listTableView.dataSource = self
        
        
        // Fetch data from data store
        fetchResultController = NSFetchedResultsController(fetchRequest: makeRequest(),managedObjectContext:context, sectionNameKeyPath:nil, cacheName: nil)
        
        fetchResultController.delegate = self
        do {try fetchResultController.performFetch()}
        catch{print("CoreData Error")}
        
        if let fetchedObjects = fetchResultController.fetchedObjects {
            item = fetchedObjects as! [Item]
        }
        
    }
    
    func buttonPressed(cell: listTableViewCell) {
        //print("buttonPress")
        
        let indexPath = self.listTableView.indexPath(for: cell)
        
        self.itemManagedObject =  self.fetchResultController.object(at: indexPath!) as! Item
        
        let entity = NSEntityDescription.entity(forEntityName: "History", in: self.context)
        self.historyManagedObject = History(entity:entity!, insertInto: self.context)
        self.historyManagedObject.name = self.itemManagedObject.name
        self.historyManagedObject.price = self.itemManagedObject.price
        self.historyManagedObject.number = self.itemManagedObject.number
        self.historyManagedObject.image = self.itemManagedObject.image
        
        do {try self.context.save()}
        catch{ print("Core data Error: contect does not save")}
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return (fetchResultController.sections?.count)!
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return fetchResultController.sections! [section].numberOfObjects
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! listTableViewCell
        
        cell.delegate = self
        
        itemManagedObject = item[indexPath.row]
        
        // fetchResultController.object(at: indexPath) as! ShoppingItem
        
        // Configure the cell...
        cell.nameLabel.text = itemManagedObject.name
        cell.priceLabel.text = "$: "+itemManagedObject.price!
        cell.numberLabel.text = "Num: "+itemManagedObject.number!
        cell.imageView?.image = UIImage(data: itemManagedObject.image as! Data)
        
        return cell
    }
    
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        if let fetchedObjects = controller.fetchedObjects {
            item = fetchedObjects as! [Item]
        }
        
        listTableView.reloadData()
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "cellSegue" {
            
            
            
            // get indexpath
            let indexPath = listTableView.indexPath(for: sender as! UITableViewCell)
            
            
            
            // extract from frc the managedObject at indexPath
            itemManagedObject = fetchResultController.object(at: indexPath!) as! Item
            
            // get the destination
            
            let navContoller = segue.destination as! UINavigationController
            let destination = navContoller.topViewController as! addTableViewController
            
            // push data
            destination.itemManagedObject = itemManagedObject
        
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
            context.delete(item[indexPath.row])
            do {try context.save()}
            catch {print("save error")}
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
}
