//
//  FeedManager.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 16/10/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import Foundation

class FeedManager {
    
    func load(closure: (Array<Article>) -> ()) {
        
        let url = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&q=http://betting.betfair.com/index.xml&num=20")
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            
            var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            
            var articles = FeedParser.parseFeed(jsonOptional)
            
            closure(articles)
        }
        
        // TODO refactor to use NSURLSessionDataTask

       /* let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            
            var articles = FeedParser.parseFeed(jsonOptional)
            
            closure(articles)
        })
        
        task.resume()
        */
    }
}