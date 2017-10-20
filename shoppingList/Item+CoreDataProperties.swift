//
//  Item+CoreDataProperties.swift
//  shoppingList
//
//  Created by 申婧雅 on 17/4/10.
//  Copyright © 2017年 JingyaShen. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var details: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var image: NSData?
    @NSManaged public var number: String?

}
