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
    var chosenPlaceLatitude = Double()
    var chosenPlaceLongitude = Double()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getDataFromParse()
    }
    
    func getDataFromParse(){
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(titleInput: "Error!", messageInput: error!.localizedDescription)
            }else{

                if objects != nil {
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0]
                        
                        //Objects
                        
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.detailsNameLabel.text = placeName
                        }
                        
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.detailsTypeLabel.text = placeType
                        }
                        
                        if let placeComment = chosenPlaceObject.object(forKey: "comment") as? String {
                            self.detailsCommentLabel.text = placeComment
                        }
                        
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude){
                                self.chosenPlaceLatitude = placeLatitudeDouble
                            }
                            
                        }
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitudeDouble = Double(placeLongitude){
                                self.chosenPlaceLongitude = placeLongitudeDouble
                            }
                            
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject{
                            imageData.getDataInBackground { data, error in
                                if error == nil {
                                    if data != nil {
                                        self.detailsImageView.image = UIImage(data: data!)
                                    }
                                }
                            }
                        }
                        
                        //Maps
                        
                        let location = CLLocationCoordinate2D(latitude: self.chosenPlaceLatitude, longitude: self.chosenPlaceLongitude)
                        
                        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        
                        let region = MKCoordinateRegion(center: location, span: span)
                        
                        self.detailsMapView.setRegion(region, animated: true)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.detailsNameLabel.text!
                        annotation.subtitle = self.detailsTypeLabel.text!
                        self.detailsMapView.addAnnotation(annotation)
                    }
                }
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
