//
//  ViewController.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-28.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var datetxt: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypetxt: UILabel!
    @IBOutlet weak var locationtxt: UILabel!
    @IBOutlet weak var currentWeathertxt: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWaether : CurrentWeather!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWaether = CurrentWeather()
        
        print(CURRENT_WEATHER_URL)
        currentWaether.downloadCurrentWeatherDetails {
           self.updateCurrentWeather()
            
        
        }
    }
    
    
    
    
    func updateCurrentWeather(){
        datetxt.text = currentWaether.date
        currentWeatherTypetxt.text = currentWaether.weatherType
        locationtxt.text = currentWaether.cityName
        currentWeathertxt.text = "\(currentWaether.currentTemp)°"
        currentWeatherImage.image = UIImage(named: currentWaether.weatherType)
        
    }
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }


}

