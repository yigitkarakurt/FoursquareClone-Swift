//
//  PlacesVC.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 29.11.2022.
//

import UIKit
import Parse

class PlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var placeNameArray = [String]()
    var placeIdArray = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromParse()
        
    }
    
    func getDataFromParse(){
        
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { objects, error in
            
            if error != nil {
                self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
            }else{
                if objects != nil {
                    
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    
                    for object in objects!{
                        if let placeName = object.object(forKey: "name") as? String{
                            if let placeId = object.objectId as? String{
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    @objc func addButtonClicked(){
        //Segue
        performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
        
    }
    
    @objc func logoutButtonClicked(){
        
        PFUser.logOutInBackground { error in
            if error != nil{
                self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
            }else{
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
            }
        }
        
        
    }
    
    func makeAlert(titleInput : String ,messageInput : String ){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    

    
    
    
}
