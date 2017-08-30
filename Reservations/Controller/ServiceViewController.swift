//
//  ServiceViewController.swift
//  Reservations
//
//  Created by Julio Lopez on 8/29/17.
//  Copyright © 2017 Julio Lopez. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    
    @IBOutlet weak var scrollView: GalleryScrollView?
    
    // Could have created a UIView in a separate class to make it cleaner and just initialized it in the view controller. Also, adding constraints programmatically for more flexibility.
    
    // Implementation would have looked like:
    //  let xibView = UINib(nibName: "View", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    //  xibView.frame = frame
    //  self.addSubview(xibView)
    
    @IBOutlet weak var promotionView: UIView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var serviceTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViewController()
    }
}

// MARK: - Scrollview + additional setup
extension ServiceViewController {
    func setupScrollView() {
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view1.backgroundColor = UIColor.red
        
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view2.backgroundColor = UIColor.green
        
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view3.backgroundColor = UIColor.blue
        
        scrollView?.numPages = 3
        scrollView?.viewObjects = [view1, view2, view3]
        
        scrollView?.setup()
    }
    
    func setupViewController() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "SPA SERVICE"
    }
}
