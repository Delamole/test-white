//
//  CityTableViewCell.swift
//  test_white
//
//  Created by Владислав Бочаров on 15.03.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var nameCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(item: WeatherOfCity){
        nameCity.text = item.city.name
        conditionLabel.text = item.weather.fact.condition
        tempLabel.text = "\(item.weather.fact.temp) 'C"
    }

}
