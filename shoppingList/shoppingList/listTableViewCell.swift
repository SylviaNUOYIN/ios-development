//
//  listTableViewCell.swift
//  shoppingList
//
//  Created by 申婧雅 on 17/4/10.
//  Copyright © 2017年 JingyaShen. All rights reserved.
//

import UIKit
import CoreData

protocol listCellDelegate {
    func buttonPressed(cell: listTableViewCell)
    
}


class listTableViewCell: UITableViewCell {
    var delegate: listCellDelegate?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var listImageView: UIImageView!
    @IBAction func orderActionButton(_ sender: Any) {
        self.delegate?.buttonPressed(cell: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
}

