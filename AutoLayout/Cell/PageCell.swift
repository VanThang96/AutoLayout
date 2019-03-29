//
//  PageCell.swift
//  AutoLayout
//
//  Created by win on 3/28/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page : Page? {
        didSet{
            imageView.image = UIImage(named: page!.imageView)
            let attributedText = NSMutableAttributedString(string: (page?.headerText)!, attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSMutableAttributedString(string: "\n\n\(page!.bodyText)", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let topContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bear_first")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    private func  setupLayout(){
        addSubview(topContainer)
        addSubview(descriptionTextView)
        
        //autolayout topcontainer
        topContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        //autolayout imageView
        topContainer.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        //autolayout descriptionTextview
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant : -24).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 24).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
}
