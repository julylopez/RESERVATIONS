//
//  ViewController.swift
//  Reservations
//
//  Created by Julio Lopez on 8/29/17.
//  Copyright © 2017 Julio Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    
    }
}

// MARK: - UITableView delegate + data source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyReservationsTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyReservationsTableViewCell.cellIdentifier(), for: indexPath) as! MyReservationsTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - View controller setup + table view setup + initialize objects
extension ViewController {
    func setupViewController() {
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: MyReservationsTableViewCell.cellName(), bundle:  nil), forCellReuseIdentifier: MyReservationsTableViewCell.cellIdentifier())
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createReservationButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.title = "MY RESERVATIONS"
    }
}

// MARK: - Button implementation
extension ViewController {
    func createReservationButtonPressed(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let serviceViewController = storyboard.instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
        self.navigationController?.pushViewController(serviceViewController, animated: true)
    }
}
