//
//  ExpenseCell.swift
//  Application
//
//  Created by Jade Myers on 6/02/20.
//  Copyright © 2020 Jade Myers. All rights reserved.
//

import UIKit

class ExpenseCell: UITableViewCell {

    @IBOutlet weak var expenseTitle: UILabel!
    
    
    @IBOutlet weak var expenseNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
