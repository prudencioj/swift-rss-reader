//
//  FeedManager.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 16/10/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import Foundation

class FeedManager {
    
    // class variables are not supported yet
    let feedUrl = "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&q=http://betting.betfair.com/index.xml&num=20"
    
    func load(closure: (Array<Article>) -> ()) {
        
        let url = NSURL(string: feedUrl)
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            
            // parse the json feed
            
            let articles = FeedParser.parseFeed(jsonOptional)
            
            // return articles in the main thread
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                
                closure(articles)
            })
        })
        
        task.resume()
    }
}