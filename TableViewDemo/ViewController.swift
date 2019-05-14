//
//  ViewController.swift
//  TableViewDemo
//
//  Created by aaron.harris on 5/14/19.
//  Copyright © 2019 Aaron Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var menuItems = ["Turkey Sandwich", "Tuna Sandwich", "BBQ Chicken Sandwich", "Roast Beef", "French Dip"]
    
    @IBOutlet weak var tableView: UITableView!
    
    //setup number of items per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //called to render each cell in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dataSource = self;
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel!.text = menuItems[indexPath.row]
        
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

