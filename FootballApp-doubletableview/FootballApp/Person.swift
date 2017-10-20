//
//  Person.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/6.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import Foundation

class Person
{
    // properties
    var cname    : String = ""
    var name    : String = ""
    var birth : String = ""
    var position   : String = ""
    var number   : String = ""
    var image   : String = ""
    var url : String = ""
    
    
    // init-s
    init()
    {
        self.cname    = "Joe Doe"
        self.name    = "Joe Doe"
        self.birth = "n/a"
        self.position   = "n/a"
        self.number   = "n/a"
        self.image   = "n/a"
        self.url = "n/a"
        
    }
    
    init(cname:String, name:String, birth:String, position:String, number:String, image:String, url:String)
    {
        self.cname    = cname
        self.name    = name
        self.birth = birth
        self.position   = position
        self.number   = number
        self.image   = image
        self.url = url
        
        
    }
    // methods
    func printPerson(){
        print("Name: \(self.name) Birth: \(self.birth) and Position \(self.position)")
    }
}
