//
//  BudgetsController.swift
//  Application
//
//  Created by Jade Myers on 2/02/20.
//  Copyright © 2020 Jade Myers. All rights reserved.
//

import UIKit
import RealmSwift

class BudgetsController : UIViewController {
    
    let realm = try! Realm()
    
    var budgets : Results<Budget>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadBudgets()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BudgetCell", bundle: nil), forCellReuseIdentifier: "cell")
        print("Test")
    }
    
    func loadBudgets(){
        budgets = realm.objects(Budget.self)
    }
    
}

//MARK: - TableView

extension BudgetsController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return budgets?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
