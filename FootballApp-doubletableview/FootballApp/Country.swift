
//
//  Country.swift
//  FootballApp
//
//  Created by 申婧雅 on 17/3/5.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import Foundation

class Country{
    
    // properties
    var data : [Person] = []
    
    init(fromXML:String){
        
        // make a XMLPeopleParser and begin parsing
        let parser = XMLPeopleParser(name: fromXML)
        parser.beginParsing()
        
        // init data
        self.data = parser.country
    }
    
    var cname : String = ""
    
    // init-s
    init()
    {
        self.cname = "n/a"
    }
    
    init(cname:String)
    {
        self.cname = cname
    }
    
    
    // methods
    func getPerson(id:Int)->Person{
        return data[id]
    }
    
    func getCount()->Int{
        return data.count
    }
    
    
}
