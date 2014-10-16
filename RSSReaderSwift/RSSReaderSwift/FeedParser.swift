//
//  FeedParser.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 16/10/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

class FeedParser {
    
    class func parseFeed(jsonOptional: AnyObject?) -> Array<Article> {
        
        var articles : Array<Article> = Array<Article>()
        
        // ugly parsing... other options without an external lib?
        
        if let jsonDictionary = jsonOptional as? Dictionary<String, AnyObject> {
            
            if let jsonResponseData = jsonDictionary["responseData"] as AnyObject? as? Dictionary<String, AnyObject> {
                
                if let jsonFeed = jsonResponseData["feed"] as AnyObject? as? Dictionary<String, AnyObject> {
                    
                    if let jsonEntries = jsonFeed["entries"] as AnyObject? as? Array<AnyObject> {
                        
                        for var i = 0 ; i < jsonEntries.count ; ++i {
                            
                            if let entriesDictionary = jsonEntries[i] as AnyObject? as? Dictionary<String, AnyObject> {
                                
                                if let title = entriesDictionary["title"] as AnyObject? as? String {
                                    
                                    articles.append(Article(title: title))
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return articles
    }
}