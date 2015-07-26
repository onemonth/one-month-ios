//
//  Video.swift
//  VimeoStaffPicks
//
//  Created by Alfie Hanssen on 5/20/15.
//  Copyright (c) 2015 Alfie Hanssen. All rights reserved.
//

import Foundation
import UIKit

class Video {
    
    var name: String? = ""
    var duration: Int? = 0
    var imageURLString: String? = ""
    
    init(dictionary: Dictionary<String,AnyObject>) {
        
        self.name = dictionary["name"] as? String
        self.duration = dictionary["duration"] as? Int

        var pictures = dictionary["pictures"] as? Dictionary<String,AnyObject>
        if let constPictures = pictures {
            
            var sizes = constPictures["sizes"] as? Array<Dictionary<String,AnyObject>>
            if let constSizes = sizes {
                
                if constSizes.count > 0 {

                    let screenWidth = UIScreen.mainScreen().bounds.size.width * UIScreen.mainScreen().scale
                    
                    let viableSizes = constSizes.filter({$0["width"] as? CGFloat >= screenWidth})
                    
                    if viableSizes.count > 0 {
                        
                        let selectedSize = viableSizes[0]
                        
                        self.imageURLString = selectedSize["link"] as? String
                    }
                    else
                    {
                        let selectedSize = constSizes.last
                        
                        self.imageURLString = selectedSize?["link"] as? String
                    }
                }
            }
        }
    }
    
    
}