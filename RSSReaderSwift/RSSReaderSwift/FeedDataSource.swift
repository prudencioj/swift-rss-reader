//
//  ArticleDataSource.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ArticleDataSource : NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    weak var collectionView : UICollectionView?
    var articles: Array<Article> = Array()
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        self.collectionView?.backgroundColor = UIColor.redColor()

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.registerClass(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCollectionViewCell")
    }
    
    func refresh(articles: Array<Article>) {
        
        self.articles = articles
        self.collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.articles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var collectionViewCell : ArticleCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ArticleCollectionViewCell", forIndexPath: indexPath) as ArticleCollectionViewCell
        
        var article = self.articles[indexPath.row]
        
        collectionViewCell.label.text = article.title
        
        return collectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.frame.width, collectionView.frame.height)
    }
}