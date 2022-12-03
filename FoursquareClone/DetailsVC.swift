//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 30.11.2022.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsTypeLabel: UILabel!
    @IBOutlet weak var detailsCommentLabel: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    var chosenPlaceId = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(titleInput: "Error!", messageInput: error!.localizedDescription)
            }else{
                print(objects!)
            }
        }

        
    }
    
    func makeAlert(titleInput : String ,messageInput : String ){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    

    

}
