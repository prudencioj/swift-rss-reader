//
//  ArticleCollectionViewCell.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    // is there a better way to define constants?
    let horizontalMargin = 10
    let topMargin = 10
    
    var label : UILabel?
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        defineSubviews()
        
        defineConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Override
    
    override var reuseIdentifier: String { get {
            return "ArticleCollectionViewCell"
        }}
    
    // MARK: Layout
    
    func defineSubviews() {
        
        label = UILabel()
        label?.lineBreakMode = .ByWordWrapping
        label?.numberOfLines = 0
        label?.textAlignment = .Center
        
        label?.backgroundColor = UIColor.brownColor()
        
        contentView.addSubview(label!)
    }
    
    func defineConstraints() {
        
        label?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let constraintMetrics = ["horizontalMargin": horizontalMargin, "topMargin": topMargin]
        let constraintViews = ["title": label!]
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-horizontalMargin-[title]-horizontalMargin-|", options: nil, metrics: constraintMetrics, views: constraintViews)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[title]-|", options: nil, metrics: constraintMetrics, views: constraintViews)
        
        contentView.addConstraints(horizontalConstraints+verticalConstraints)
    }
}