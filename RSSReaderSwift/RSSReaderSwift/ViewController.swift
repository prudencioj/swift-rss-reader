//
//  ViewController.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSource : ArticleDataSource?
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        collectionView = UICollectionView(frame: CGRectZero,collectionViewLayout: layout)
        collectionView?.pagingEnabled = true
        
        dataSource = ArticleDataSource(collectionView: collectionView!)
        
        view.addSubview(collectionView!)
        
        collectionView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        
        view.addConstraints(horizontalConstraint+verticalConstraint)
        
        
        let url = NSURL(string: "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&q=https://betting.betfair.com/index.xml&num=20")
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            
            var jsonErrorOptional: NSError?
            let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &jsonErrorOptional)
            
            var articles = FeedParser.parseFeed(jsonOptional)
            
            self.dataSource?.refresh(articles)
        }
    }
}

