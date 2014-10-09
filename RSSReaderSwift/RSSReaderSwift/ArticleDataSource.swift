//
//  ArticleDataSource.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 joaoprudencio. All rights reserved.
//

import UIKit

class ArticleDataSource : NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    weak var collectionView : UICollectionView?
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        self.collectionView?.backgroundColor = UIColor.redColor()

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.registerClass(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "ArticleCollectionViewCell")
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var collectionViewCell : ArticleCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ArticleCollectionViewCell", forIndexPath: indexPath) as ArticleCollectionViewCell
        
        collectionViewCell.label?.text = "title"
        
        return collectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.frame.width, 100)
    }
    
    // MARK: UICollectionViewDelegate
    
}