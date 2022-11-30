//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Yiğit Karakurt on 30.11.2022.
//

import Foundation
import UIKit

class PlaceModel{
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeComment = ""
    var placeImage = UIImage()
    
    private init(){}
    
}
