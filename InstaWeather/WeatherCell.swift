//
//  WeatherCell.swift
//  InstaWeather
//
//  Created by Jaskeerat Singh Bhatia on 2017-08-31.
//  Copyright © 2017 Jaskeerat Singh Bhatia. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var daytxt: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var weatherTypetxt: UILabel!
    @IBOutlet weak var weatherTypeImage: UIImageView!
    
    
    func loadCellData(forecast: Forecast){
        self.daytxt.text = forecast.date
        self.maxTemp.text = forecast.maxTemp
        self.minTemp.text = forecast.minTemp
        self.weatherTypetxt.text = forecast.weatherType
        self.weatherTypeImage.image = UIImage(named: "\(forecast.weatherType)")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
