//
//  Location.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-31.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import Foundation

class Location{
    
     var latitude : Double!
     var longitude : Double!
    static var sharedInstance = Location()
    
    private init(){}
}
