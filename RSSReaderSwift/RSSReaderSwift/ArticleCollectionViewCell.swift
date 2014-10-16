//
//  ArticleCollectionViewCell.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    var label : UILabel = UILabel()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        defineSubviews()
        
        defineConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Layout
    
    func defineSubviews() {
        
        label.lineBreakMode = .ByWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .Center
        
        contentView.addSubview(label)
    }
    
    func defineConstraints() {
        
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[title]-10-|", options: nil, metrics: nil, views: ["title" : label]))
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[title]", options: nil, metrics: nil, views: ["title" : label]))
    }
}