//
//  ViewController.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var collectionView : UICollectionView?
    var dataSource : ArticleDataSource?
    var feedManager : FeedManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        defineSubviews()
        
        defineConstraints()
        
        refreshFeed()
    }
    
    // MARK: Layout
    
    func defineSubviews() {
        
        // setup collection view
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRectZero,collectionViewLayout: layout)
        collectionView?.pagingEnabled = true
        
        view.addSubview(collectionView!)
        
        // setup data source responsible of populating the collection view
        
        dataSource = ArticleDataSource(collectionView: collectionView!)
    }
    
    func defineConstraints() {
        
        collectionView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        
        view.addConstraints(horizontalConstraint+verticalConstraint)
    }
    
    // MARK: Manage feed
    
    func refreshFeed() {
        
        feedManager = FeedManager()
        
        feedManager?.load( { (articles: Array<Article>) -> () in
            
            println(articles)
            self.dataSource?.refresh(articles)
        })
    }
}