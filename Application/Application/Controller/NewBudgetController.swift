//
//  NewBudgetController.swift
//  Application
//
//  Created by Jade Myers on 6/02/20.
//  Copyright © 2020 Jade Myers. All rights reserved.
//

import UIKit
import RealmSwift

class NewBudgetController : UIViewController {
    
    @IBOutlet weak var budgetName: UITextField!
    
    @IBOutlet weak var budgetIncome: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
    }
    
    @IBAction func submitNewBudget(_ sender: UIButton) {
        
        //If the user has filled in the fields.
        if let newBudgetName = budgetName.text, let newBudgetIncome = budgetIncome.text {
            let newBudget = Budget()
            newBudget.title = newBudgetName
            newBudget.income = Int(newBudgetIncome) ?? 0
            do {
             try! realm.write {
                            realm.add(newBudget)
                        }
            }catch {
                print("Failed to add a new Budget")
            }
           
        }
    }
}
