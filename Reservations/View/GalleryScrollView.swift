//
//  GalleryScrollView.swift
//  Reservations
//
//  Created by Julio Lopez on 8/29/17.
//  Copyright © 2017 Julio Lopez. All rights reserved.
//

import UIKit

class GalleryScrollView: UIScrollView, UIScrollViewDelegate {
    var pageControl: UIPageControl?
    @IBOutlet var viewObjects: [UIView]?
    var numPages: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        scrollsToTop = false
        delegate = self
    }
    
    func setup() {
        guard let parent = superview else { return }
        
        contentSize = CGSize(width: (frame.size.width * (CGFloat(numPages) + 2)), height: frame.size.height)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 400, width: parent.frame.size.width, height: 25))
        pageControl?.numberOfPages = numPages
        pageControl?.currentPage = 0
        pageControl?.addTarget(self, action: Selector(("changePage:")), for: .touchDown)
        pageControl?.isUserInteractionEnabled = false
        parent.addSubview(pageControl!)
        
        loadScrollViewWithPage(page: 0)
        loadScrollViewWithPage(page: 1)
        loadScrollViewWithPage(page: 2)
        
        var newFrame = frame
        newFrame.origin.x = newFrame.size.width
        newFrame.origin.y = 0
        scrollRectToVisible(newFrame, animated: false)
        
        layoutIfNeeded()
    }
    
    private func loadScrollViewWithPage(page: Int) {
        if page < 0 { return }
        if page >= numPages + 2 { return }
        
        var index = 0
        
        if page == 0 {
            index = numPages - 1
        } else if page == numPages + 1 {
            index = 0
        } else {
            index = page - 1
        }
        
        let view = viewObjects?[index]
        
        var newFrame = frame
        newFrame.origin.x = frame.size.width * CGFloat(page)
        newFrame.origin.y = 0
        view?.frame = newFrame
        
        if view?.superview == nil {
            addSubview(view!)
        }
        
        layoutIfNeeded()
    }
    
    
    @objc internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page = floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1
        pageControl?.currentPage = Int(page - 1)
        
        loadScrollViewWithPage(page: Int(page - 1))
        loadScrollViewWithPage(page: Int(page))
        loadScrollViewWithPage(page: Int(page + 1))
    }
    
    @objc internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page : Int = Int(floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1)
        
        if page == 0 {
            contentOffset = CGPoint(x: pageWidth*(CGFloat(numPages)), y: 0)
        } else if page == numPages+1 {
            contentOffset = CGPoint(x: pageWidth, y: 0)
        }
    }
}
