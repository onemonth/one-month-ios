//
//  StaffPicksViewController.swift
//  VimeoStaffPicks
//
//  Created by Alfie Hanssen on 5/19/15.
//  Copyright (c) 2015 Alfie Hanssen. All rights reserved.
//

import UIKit

class StaffPicksViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    
    let items = ["alfie", "lee", "mattan", "syd", "zach"]
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupTableView()
    }
    
    // MARK: Setup
    
    func setupTableView() {
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "placeholder")
    }
    
    // MARK: UITableViewDatasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("placeholder") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
}
