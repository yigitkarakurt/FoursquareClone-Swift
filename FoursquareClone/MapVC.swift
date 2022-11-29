//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 30.11.2022.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
        
        
        
    }
    @objc func saveButtonClicked(){
        
    }
    @objc func backButtonClicked(){
        self.dismiss(animated: true)
    }
    

    
}
