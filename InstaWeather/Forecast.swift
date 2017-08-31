//
//  Forecast.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-31.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    private var _minTemp:String!
    private var _maxTemp:String!
    private var _weatherType:String!
    private var _date:String!
    
    var minTemp : String {
        if _minTemp == nil{
            _minTemp = ""
        }
        return _minTemp
    }
    
    var maxTemp : String {
        if _maxTemp == nil{
            _maxTemp = ""
        }
        return _maxTemp
    }
    
    var weatherType : String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var date : String {
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    init(weatherDict : Dictionary<String,AnyObject>){
        
        if let temp = weatherDict["temp"] as? Dictionary<String,Float>{
            if let min = temp["min"]{
                self._minTemp = "\(min-273.15)°"
            }
            if let max = temp["max"]{
                self._maxTemp = "\(max-273.15)°"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main.capitalized
            }
        }
        
        if let dt = weatherDict["dt"] as? Double{
            let unixDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixDate.dayOfTheWeek()
        }
        
        
    }

}

extension Date{
    
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
