//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 29.11.2022.
//

import UIKit

class AddPlaceVC: UIViewController {
    
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeCommentText: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        backgroundImageView.alpha = 0.8
    }
    

    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
}


