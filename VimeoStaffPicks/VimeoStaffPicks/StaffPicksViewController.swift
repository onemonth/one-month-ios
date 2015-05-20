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
    
    let items = ["alfie", "lee", "mattan", "syd", "zach", "sjdhfalksdfhalsdfhlasdhflkjasdhfladhsfalkjsdhflkajshdflkjahsdflkajhsdflkajhsdf"]
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "Staff Picks"
        
        self.setupTableView()
    }
    
    // MARK: Setup
    
    func setupTableView() {

        let nib = UINib(nibName: "VideoCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: NSStringFromClass(VideoCell.self))
    }
    
    // MARK: UITableViewDatasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(VideoCell.self)) as! VideoCell
        
        cell.nameLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
}
