//
//  ArticleDataSource.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ArticleDataSource : NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    let articleCellReuseIdentifier = "ArticleCollectionViewCell"
    
    weak var collectionView : UICollectionView?
    var articles: Array<Article>?
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        self.collectionView?.backgroundColor = UIColor.redColor()

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.registerClass(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: articleCellReuseIdentifier)
    }
    
    func refresh(articles: Array<Article>) {
        
        self.articles = articles
        collectionView?.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return articles? == nil ? 0 : articles!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let collectionViewCell : ArticleCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(articleCellReuseIdentifier, forIndexPath: indexPath) as ArticleCollectionViewCell
        
        let article = articles?[indexPath.row]
        
        collectionViewCell.label?.text = article?.title
        
        return collectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.frame.width, collectionView.frame.height)
    }
}