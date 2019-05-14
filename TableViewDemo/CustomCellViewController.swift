//
//  CustomCellViewController.swift
//  TableViewDemo
//
//  Created by aaron.harris on 5/14/19.
//  Copyright © 2019 Aaron Harris. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController, UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuItemTableViewCell
        
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = breakfast[indexPath.row]
//        case 1:
//            cell.textLabel?.text = lunch[indexPath.row]
//        case 2:
//            cell.textLabel?.text = dinner[indexPath.row]
//        default:
//            cell.textLabel?.text = "error retrieving data"
//        }
        
        cell.ItemName.text = "Testing Name"
        cell.ItemDescription.text = "idk if this will work"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        //not sure how to change row height automatically yet, but manually doing this for now
        self.tableView.rowHeight = 75
        self.tableView.register(UINib.init(nibName: "MenuItemTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
        

    }
}
