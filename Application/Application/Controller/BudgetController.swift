//
//  BudgetController.swift
//  Application
//
//  Created by Jade Myers on 6/02/20.
//  Copyright © 2020 Jade Myers. All rights reserved.
//

import UIKit
import RealmSwift

class BudgetController : UIViewController {
    
    @IBOutlet weak var budgetName: UILabel!
    
    @IBOutlet weak var budgetIncome: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedBudget : Budget?
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        loadBudget()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: Constants.expenseCellNibName, bundle: nil), forCellReuseIdentifier: Constants.expenseCellIndentifier)
        
    }
    
    func loadBudget(){
        budgetName.text = selectedBudget?.title
        budgetIncome.text = "$\(selectedBudget?.income ?? 0)"
    }
}

//MARK: - TableView DataSource

extension BudgetController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let expenseCell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseCellIndentifier, for: indexPath) as! ExpenseCell
        
        return expenseCell
    }
    
    
}

//MARK: - TableView Delegate

extension BudgetController : UITableViewDelegate {
    
}
