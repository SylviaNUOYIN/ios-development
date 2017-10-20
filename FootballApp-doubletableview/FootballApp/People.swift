//
//  People.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/7.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import Foundation

class People{
    
    // properties
    var data : [Country] = []
    
    init(fromXML:String){
        
        // make a XMLPeopleParser and begin parsing
        let parser = XMLPeopleParser(name: fromXML)
        parser.beginParsing()
        
        // init data
        self.data = parser.people
    }
    
    // init-s
  
    
    // methods
    func getCountry(id:Int)->Country{
        return data[id]
    }
    
    func getCount()->Int{
        return data.count
    }
    
    
}
