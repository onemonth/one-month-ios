//
//  VideoCell.swift
//  VimeoStaffPicks
//
//  Created by Alfie Hanssen on 5/19/15.
//  Copyright (c) 2015 Alfie Hanssen. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    var task: URLSessionDataTask?
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var durationLabel: UILabel?
    @IBOutlet weak var videoImageView: UIImageView?
    
    var video: Video? {
        didSet {
            
            if let constVideo = video {
             
                self.nameLabel?.text = constVideo.name
                
                if let constDuration = constVideo.duration {
                    self.durationLabel?.text = constDuration
                }
                else {
                    self.durationLabel?.text = "00:00"
                }
                
                if let constImageURLString = constVideo.imageURLString {
                    
                    let url = URL(string: constImageURLString)!
                    
                    self.task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) -> Void in
                        
                        DispatchQueue.main.async(execute: { () -> Void in

                            if let strongSelf = self {

                                if constImageURLString != strongSelf.video?.imageURLString {
                                    return
                                }
                                
                                strongSelf.task = nil
                                
                                if let data = data {
                                    
                                    let image = UIImage(data: data)
                                    strongSelf.videoImageView?.image = image
                                    
                                }
                                else {
                                    // TODO: alert the user?
                                }

                            }

                        })
                        
                    })
                    
                    self.task?.resume()
                }

            }
        }
    }
    
    deinit {
        self.task?.cancel()
        self.task = nil
    }
    
    override func prepareForReuse() {
        self.video = nil
        self.nameLabel?.text = ""
        self.durationLabel?.text = ""
        self.videoImageView?.image = nil
        self.task?.cancel()
        self.task = nil
    }
    
}
