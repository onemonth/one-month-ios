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
    
    var items: Array<Video> = []
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "Staff Picks"
        
        self.setupTableView()
        
        self.refreshItems()
    }
    
    // MARK: Setup
    
    func setupTableView() {

        let nib = UINib(nibName: "VideoCell", bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: NSStringFromClass(VideoCell.self))
    }
    
    // MARK: UITableViewDatasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(VideoCell.self)) as! VideoCell
        
        let video = self.items[(indexPath as NSIndexPath).row]
        cell.video = video
        
        return cell
    }
    
    func refreshItems() {
        
        VimeoClient.staffpicks { (videos, error) -> Void in
            
            if let constVideos = videos {
             
                self.items = constVideos
                
                self.tableView?.reloadData()

            }
            else {
                // TODO: alert the user
            }
        }
    }
    
}
