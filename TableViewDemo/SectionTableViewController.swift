//
//  SectionTableViewController.swift
//  TableViewDemo
//
//  Created by aaron.harris on 5/14/19.
//  Copyright © 2019 Aaron Harris. All rights reserved.
//

import UIKit

class SectionTableViewController: UIViewController, UITableViewDataSource {
    var breakfast = ["Belgian Waffle", "Farmer's Omelet", "Veggie Scramble", "Sausage Breakfast Sandwich"]
    var lunch = ["Turkey Sandwich", "Tuna Sandwich", "BBQ Chicken Sandwich", "Roast Beef", "French Dip"]
    var dinner = ["Steak", "Smoked Salmon", "Bourbon Burger"]
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //setup number of items per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return breakfast.count
        case 1:
            return lunch.count
        case 2:
            return dinner.count
        default:
            return 0
        }
    }
    
    //setup header title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Breakfast"
        case 1:
            return "Lunch"
        case 2:
            return "Dinner"
        default:
            return "NA"
        }
    }
    
    //called to render each cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dataSource = self;
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = breakfast[indexPath.row]
        case 1:
            cell.textLabel?.text = lunch[indexPath.row]
        case 2:
            cell.textLabel?.text = dinner[indexPath.row]
        default:
            cell.textLabel?.text = "error retrieving data"
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        
        tableView.dataSource = self
    }
}
