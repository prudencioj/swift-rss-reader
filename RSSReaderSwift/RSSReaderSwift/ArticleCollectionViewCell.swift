//
//  ArticleCollectionViewCell.swift
//  RSSReaderSwift
//
//  Created by joaoprudencio on 22/09/14.
//  Copyright (c) 2014 Blip. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    var label : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
        
        contentView.addSubview(label!)
        
        label?.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let constraintX = NSLayoutConstraint(item: label!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let constraintY = NSLayoutConstraint(item: label!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        contentView.addConstraints([constraintX,constraintY])
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}