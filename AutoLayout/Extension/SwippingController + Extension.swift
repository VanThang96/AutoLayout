//
//  SwippingController + Extension.swift
//  AutoLayout
//
//  Created by win on 3/30/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import  UIKit
extension SwippingController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_)  in
            if self.pageControll.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                self.collectionViewLayout.invalidateLayout()
                let indexpath  = IndexPath(item: self.pageControll.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
        
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControll.currentPage = Int(x / view.frame.width)
    }
}
