//
//  DetailsViewController.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/7.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // outlets
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!

    @IBOutlet weak var personBirthLabel: UILabel!
    @IBOutlet weak var personPositionLabel: UILabel!
    @IBOutlet weak var personNumberLabel: UILabel!
    
    var personData : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Details"
        
        personNameLabel.text = personData.name
        personBirthLabel.text = personData.birth
        personPositionLabel.text = personData.position
        personNumberLabel.text = personData.number
        
        personImageView.image = UIImage(named: personData.image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "thirdSegue"
        {
            // get the destination controller
            let destination = segue.destination as! WebViewController
            
            destination.personData = personData
            
            
        }

    }
    

}
