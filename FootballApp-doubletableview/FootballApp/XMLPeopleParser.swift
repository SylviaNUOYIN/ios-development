//
//  XMLPeopleParser.swift
//  MVC Person App
//
//  Created by 申婧雅 on 17/2/21.
//  Copyright © 2017年 Jingya Shen. All rights reserved.
//

import Foundation
import UIKit

class XMLPeopleParser : NSObject, XMLParserDelegate{
    
    // properties
    var name : String
    init(name:String){self.name = name}
    
    // some variables for parsing
    var cCname : String!
    
    var pName, pBirth, pPosition, pNumber, pImage, pUrl : String! // to collect the xml data
    var passElementId : Int = -1
    var passData : Bool = false // spy variables to say which tag is found
    
    var people = [Country]()     // to collect person obj when needed
    var country = [Person]()
    
    var parser = XMLParser()
    
    let tags = ["cname","name", "birth", "position", "number", "image", "url"]
    
    // funcs for parsing
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // reset the spy vars for tags
        if tags.contains(elementName){
            
            // reset spies
            passElementId = tags.index(of: elementName)!
            passData = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        // reset spies for new pull
        if tags.contains(elementName){
            
            // reset spies
            passElementId = -1
            passData = false
        }

        
        // test if </country>
        if elementName == "country"{
            let c = Country(cname: cCname)
            
            people.append(c)
            
        }
        
        
        // test if </person>
        if elementName == "person"{
            
            // make a new person and add it to people
            let p = Person(cname: cCname, name: pName, birth: pBirth,  position: pPosition, number: pNumber, image: pImage, url: pUrl)
            
            country.append(p)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // found string where to place it 
        if passData {
            switch passElementId {
                case 0 : cCname = string
                case 1 : pName = string
                case 2 : pBirth = string
                case 3 : pPosition = string
                case 4 : pNumber = string
                case 5 : pImage = string
                case 6 : pUrl = string
                default : break
            }
        }
    }
    
    func beginParsing()
    {
        // find the file path
        let bundleURL = Bundle.main.bundleURL
        let fileURL = URL(string: self.name, relativeTo: bundleURL)
        
        parser = XMLParser(contentsOf: fileURL!)!
        
        // set the delegate and parse
        parser.delegate = self
        parser.parse()
        
    }
}
