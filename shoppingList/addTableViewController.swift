//
//  addTableViewController.swift
//  shoppingList
//
//  Created by 申婧雅 on 17/4/10.
//  Copyright © 2017年 JingyaShen. All rights reserved.
//

import UIKit
import CoreData

class addTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // coredata elements: context and managedObject
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var itemManagedObject : Item! = nil
    
    func saveItem() {
        
        // get the table / entity
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        
        // make a new person object
        itemManagedObject = Item(entity: entity!, insertInto: context)
        
        // fill with data from textfields
        itemManagedObject.name = nameTextField.text
        itemManagedObject.price = priceTextField.text
        //itemManagedObject.details = detailsTextField.text
        itemManagedObject.number = numberTextField.text
        if let itemPhoto = itemImageView.image {
            if let imageData = UIImagePNGRepresentation(itemPhoto){
                itemManagedObject.image = NSData(data: imageData)
            }
        }
        
        // save it  (see "throw" ues do catch)
        do{try context.save()}
        catch{print("CD ERROR: context does not save")}
    }
    
    func updateItem() {
        
        // fill with data from textfields
        itemManagedObject.name = nameTextField.text
        itemManagedObject.price = priceTextField.text
        //itemManagedObject.details = detailsTextField.text
        itemManagedObject.number = numberTextField.text
        if let itemPhoto = itemImageView.image {
            if let imageData = UIImagePNGRepresentation(itemPhoto){
                itemManagedObject.image = NSData(data: imageData)
            }
        }
        // save it  (see "throw" use do catch)
        do{try context.save()}
        catch{print("CD ERROR: context does not save")}
    }
    
    
    
    // outlets and action
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBAction func addActionButton(_ sender: Any) {
       
            if nameTextField.text == "" || priceTextField.text == "" || numberTextField.text == "" {
                let alertController = UIAlertController(title: "Error!", message: "Please Input All Fields", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
            }
            
            if nameTextField.text != "" && priceTextField.text != "" && numberTextField.text != ""{
                
                if itemManagedObject == nil {
                    saveItem()
                } else{
                    updateItem()
                    
                }
                
            }
            
            dismiss(animated: true, completion: nil)
            navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        self.title = "Item Details"
        super.viewDidLoad()
                // Populate textfield with managedObject data
        if itemManagedObject != nil{
            
            nameTextField.text = itemManagedObject.name
            priceTextField.text = itemManagedObject.price
            //detailsTextField.text = itemManagedObject.details
            numberTextField.text = itemManagedObject.number
            itemImageView.image = UIImage(data: itemManagedObject.image as! Data)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage {
            itemImageView.image = selectedImage
            itemImageView.contentMode = .scaleAspectFill
            itemImageView.clipsToBounds = true
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
