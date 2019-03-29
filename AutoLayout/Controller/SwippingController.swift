//
//  SwippingController.swift
//  AutoLayout
//
//  Created by win on 3/28/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import UIKit

extension  UIColor{
    static var pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var grayColor = UIColor(red: 249/255, green: 207/255, blue: 244/255, alpha: 1)
}

class SwippingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    let pages = [
        Page(imageView : "bear_first", headerText : "Join us today in our fun and game!",bodyText : "Are you ready for loads and loads for fun! Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageView : "heart_second", headerText : "Subscribe and get coupons on our daily events",bodyText : "Get notified of the saving immediately when we ancounce them on our website. Make sure to also give us any feedback you have."),
        Page(imageView : "leaf_third", headerText : "VIP members special services",bodyText : "Subscribe and get coupons on our daily events")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        setupBottomController()
    }
     private lazy var previousButton : UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrevious(){
        let previousIndex = max( pageControll.currentPage - 1 ,0)
        let indexPath = IndexPath(item: previousIndex, section: 0)
        pageControll.currentPage = previousIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    let nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControll.currentPage + 1 , pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControll : UIPageControl = {
        let pagecontroll = UIPageControl()
        pagecontroll.currentPage = 0
        pagecontroll.numberOfPages = pages.count
        pagecontroll.currentPageIndicatorTintColor = .pinkColor
        pagecontroll.pageIndicatorTintColor = .grayColor
        return pagecontroll
    }()
   
    fileprivate func setupBottomController(){
        let bottomStackViewController = UIStackView(arrangedSubviews: [previousButton,pageControll,nextButton])
        bottomStackViewController.distribution                              = .fillEqually
        bottomStackViewController.axis                                      = .horizontal
        bottomStackViewController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomStackViewController)
        NSLayoutConstraint.activate([
            bottomStackViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackViewController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackViewController.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackViewController.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? PageCell
        let page = pages[indexPath.row]
        cell?.page = page
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height)
    }
    
}
