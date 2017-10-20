//
//  WebViewController.swift
//  FootballApp
//
//  Created by 申婧雅 on 17/2/28.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!

    var personData : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "Personal Homepage"
        
        let url = NSURL(string: personData.url)
        let requestObj = NSURLRequest(url: url! as URL)
        webView.loadRequest(requestObj as URLRequest)
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

