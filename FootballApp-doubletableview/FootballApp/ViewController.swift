//
//  ViewController.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/6.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets and actions
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBAction func moreInfoAction(_ sender: Any) {
    }
    
    
    // functions and vars
    var personData : Person!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "firstSegue"
        {
            // get the destination controller
            let destination = segue.destination as! DetailsViewController
            
            destination.personData = personData
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Main Page"
        
        
        // populate the views with data
        personNameLabel.text = personData.name
        personImageView.image = UIImage(named: personData.image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

