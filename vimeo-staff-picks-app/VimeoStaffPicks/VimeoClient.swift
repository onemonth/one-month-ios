//
//  VimeoClient.swift
//  VimeoStaffPicks
//
//  Created by Alfie Hanssen on 5/20/15.
//  Copyright (c) 2015 Alfie Hanssen. All rights reserved.
//

import Foundation

typealias ServerResponseCallback = (_ videos: Array<Video>?, _ error: Error?) -> Void

class VimeoClient {
    
    static let errorDomain = "VimeoClientErrorDomain"
    static let baseURLString = "https://api.vimeo.com"
    static let staffpicksPath = "/channels/staffpicks/videos"
    static let authToken = "eeb3566316fc39f535a4276a63d90649"
    
    class func staffpicks(_ callback: @escaping ServerResponseCallback) {
        
        let URLString = baseURLString + staffpicksPath
        let URL = Foundation.URL(string: URLString)
        
        if URL == nil {
            
            let error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to create URL"])
            callback(nil, error)
            
            return
        }
        
        var request = URLRequest(url: URL!)
        request.httpMethod = "GET"
        request.addValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in

            DispatchQueue.main.async(execute: { () -> Void in
              
                if error != nil {
                    
                    callback(nil, error)
                    
                    return
                }
                
                var JSON: Dictionary<String,AnyObject>? = nil
                do {
                    JSON = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as? Dictionary<String,AnyObject>
                }
                catch let error {
                    
                    callback(nil, error)
                    
                    return
                }
                
                if JSON == nil {
                    
                    let error = NSError(domain: self.errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to parse JSON"])
                    callback(nil, error)
                    
                    return
                }
                
                var videoArray = Array<Video>()
                
                if let constJSON = JSON {

                    let dataArray = constJSON["data"] as? Array<Dictionary<String,AnyObject>>
                    
                    if let constArray = dataArray {
                        
                        for value in constArray {
                            
                            let video = Video(dictionary: value)
                            videoArray.append(video)
                        }
                    }
                }
                
                callback(videoArray, nil)

            })
        }
        
        task.resume()
    }
    
}
