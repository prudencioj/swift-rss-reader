//
//  ViewController.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 joaoprudencio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSource : ArticleDataSource?
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRectZero,collectionViewLayout: UICollectionViewFlowLayout())
        
        dataSource = ArticleDataSource(collectionView: collectionView!)
        
        view.addSubview(collectionView!)
        
        collectionView?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[collectionView]|", options: nil, metrics: nil, views: ["collectionView" : collectionView!])
        
        view.addConstraints(horizontalConstraint+verticalConstraint)
    }
}

