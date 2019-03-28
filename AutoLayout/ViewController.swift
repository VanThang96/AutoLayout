//
//  ViewController.swift
//  AutoLayout
//
//  Created by win on 3/28/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

extension  UIColor{
    static var pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var grayColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
}
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBottomController()
    }
    fileprivate func setupBottomController(){
        let previousButton : UIButton = {
            let button = UIButton()
            button.setTitle("PREV", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.gray, for: .normal)
            return button
        }()
        
        let nextButton : UIButton = {
            let button = UIButton()
            button.setTitle("NEXT", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.pinkColor, for: .normal)
            return button
        }()
        
        let pageControll : UIPageControl = {
            let pagecontroll = UIPageControl()
            pagecontroll.currentPage = 0
            pagecontroll.numberOfPages = 4
            pagecontroll.currentPageIndicatorTintColor = .pinkColor
            pagecontroll.pageIndicatorTintColor = .grayColor
            return pagecontroll
        }()
        
        let bottomStackViewController : UIStackView = {
            let container                                       = UIStackView(arrangedSubviews: [previousButton,pageControll,nextButton])
            container.distribution                              = .fillEqually
            container.axis                                      = .horizontal
            container.translatesAutoresizingMaskIntoConstraints = false
            return container
        }()
        view.addSubview(bottomStackViewController)
        NSLayoutConstraint.activate([
            bottomStackViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackViewController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackViewController.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackViewController.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    private func  setupLayout(){
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
            let attributedText = NSMutableAttributedString(string: "Join us today in our fun and game!", attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])

            attributedText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads for fun! Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
            
            textView.attributedText = attributedText
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.textAlignment = .center
            textView.translatesAutoresizingMaskIntoConstraints = false
            return textView
        }()
        view.addSubview(topContainer)
        view.addSubview(descriptionTextView)
        
        //autolayout topcontainer
        topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        //autolayout imageView
        topContainer.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        //autolayout descriptionTextview
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -24).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 24).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

