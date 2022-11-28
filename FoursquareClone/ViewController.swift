//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 27.11.2022.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        
        let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "Banana"
        parseObject["calories"] = 150
        parseObject.saveInBackground { success, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                print("uploaded")
            }
        }
        
        */
        
        let query = PFQuery(className: "Fruits")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                print(objects)
            }
        }


    }


}

