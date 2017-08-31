//
//  AppConstants.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-29.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "51da09820a852ca87315f81b83dcd1c7"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)43.65\(LONGITUDE)-79.38\(APP_ID)\(API_KEY)"

typealias DownloadCompleted = ()->()
