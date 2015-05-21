//
//  VimeoClient.swift
//  VimeoStaffPicks
//
//  Created by Alfie Hanssen on 5/20/15.
//  Copyright (c) 2015 Alfie Hanssen. All rights reserved.
//

import Foundation

typealias ServerResponseCallback = (object: Dictionary<String,AnyObject>?, error: NSError?) -> Void

class VimeoClient {
    
    class func staffpicks(callback: ServerResponseCallback) {
        
        callback(object: nil, error: nil)
        
    }
    
}