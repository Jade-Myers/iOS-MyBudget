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
        tableView.delegate = self
        
        tableView.register(UINib(nibName: Constants.budgetCellNibName, bundle: nil), forCellReuseIdentifier: Constants.budgetCellIdentifier)

    }
    
    
    @IBAction func addBudgetClicked(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: Constants.newBudgetSegue, sender: self)
        
    }
    
    func loadBudgets(){
        budgets = realm.objects(Budget.self)
        tableView.reloadData()
    }
    

}

//MARK: - TableView DataSource

extension BudgetsController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return budgets?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.budgetCellIdentifier, for: indexPath) as! BudgetCell
        
        cell.budgetTitle.text = budgets?[indexPath.row].title
        
        return cell
    }
    
    
    
}

//MARK: - TableView Delegate
extension BudgetsController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.BudgetSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.BudgetSegue {
            
            let destinationVC = segue.destination as! BudgetController
            
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationVC.selectedBudget = budgets?[indexPath.row]
            }
            
            
        }
    }
    
}
