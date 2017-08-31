//
//  ViewController.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-28.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
  
    @IBOutlet weak var datetxt: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypetxt: UILabel!
    @IBOutlet weak var locationtxt: UILabel!
    @IBOutlet weak var currentWeathertxt: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var locationManager = CLLocationManager()
    var location : CLLocation!
    var currentWaether : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        currentWaether = CurrentWeather()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        //print(CURRENT_WEATHER_URL)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
        
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            location = locationManager.location
            Location.sharedInstance.latitude = location.coordinate.latitude
            Location.sharedInstance.longitude = location.coordinate.longitude
            print(Location.sharedInstance.latitude,Location.sharedInstance.longitude)
            print(CURRENT_WEATHER_URL)
            currentWaether.downloadCurrentWeatherDetails {
                self.downloadForecastDetails {
                    self.updateCurrentWeather()
                    
                }
            }
            
            
        }
        else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    
    func updateCurrentWeather(){
        datetxt.text = currentWaether.date
        currentWeatherTypetxt.text = currentWaether.weatherType
        locationtxt.text = currentWaether.cityName
        currentWeathertxt.text = "\(currentWaether.currentTemp)°"
        currentWeatherImage.image = UIImage(named: currentWaether.weatherType)
        
    }
    
    
    func downloadForecastDetails (completed : @escaping DownloadCompleted)
    {
        let currentWeatherURL = URL(string: FORECAST_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{ response in
            
            if let dict = response.value as? Dictionary<String,AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String,AnyObject>]{
                    
                    for obj in list{
                        let forecast = Forecast(weatherDict : obj)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            
            cell.loadCellData(forecast: forecasts[indexPath.row])
            return cell
        }
        
        else{
            return WeatherCell()
        }
        
        
    }


}

