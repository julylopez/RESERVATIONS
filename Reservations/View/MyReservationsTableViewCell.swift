//
//  MyReservationsTableViewCell.swift
//  Reservations
//
//  Created by Julio Lopez on 8/29/17.
//  Copyright © 2017 Julio Lopez. All rights reserved.
//

import UIKit

class MyReservationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellViewHeader: UIView!
    @IBOutlet weak var appointmentDateLabel: UILabel!
    @IBOutlet weak var appointmentTimeLabel: UILabel!
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var serviceDurationLabel: UILabel!
    @IBOutlet weak var serviceDescriptionLabel: UITextView!
    @IBOutlet weak var rescheduleButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    static let cellId = "MyReservationsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.borderWidth = 0.2
        cellView.layer.borderColor = UIColor.lightGray.cgColor
        
        rescheduleButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
    }
    
    class func cellIdentifier() -> String {
        return cellId
    }
    
    class func cellName() -> String {
        return cellId
    }
    
    class func cellHeight() -> CGFloat {
        return 200.0
    }
}
