//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 29.11.2022.
//

import UIKit

class PlacesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
    }
    
    @objc func addButtonClicked(){
        //Segue
        
    }
    

    
    
    
}
