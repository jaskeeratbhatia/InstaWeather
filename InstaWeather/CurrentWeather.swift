//
//  CurrentWeather.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-29.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName : String!
    var _weatherType : String!
    var _date : String!
    var _currentTemp : Float!
    
    var cityName : String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType : String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp : Float{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date : String{
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    func downloadCurrentWeatherDetails(completed :  @escaping DownloadCompleted)
    {
        //Alamofire download request
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{
            response in
            let result = response.result
            //print(response)
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                }
                print(self._cityName)
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    if let weatherType = weather[0]["main"] as? String{
                        self._weatherType = weatherType.capitalized
                    }
                }
                
                print(self._weatherType)
                if let temp = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemp = temp["temp"] as? Float{
                        self._currentTemp = currentTemp - 273.15
                    }
                }
                print(self._currentTemp)
            }
            completed()
        }
        
    }
}

