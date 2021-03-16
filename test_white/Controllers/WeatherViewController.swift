//
//  WeatherViewController.swift
//  test_white
//
//  Created by Владислав Бочаров on 15.03.2021.
//

import UIKit

struct Data {
    var name: String
    var value: String
}

struct DataForecast {
    var name: String
    var max: String
    var min: String
    var cond: String
}

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var forecastCollection: UICollectionView!
    @IBOutlet weak var nameOfCityLabel: UILabel!
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var oneCity: WeatherOfCity? = nil
    var data: [Data] = []
    var forecast_parts:[DataForecast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfCityLabel.text = oneCity?.city.name
        descriptionLabel.text = "Today is \(oneCity?.weather.fact.condition ?? ""). Temperature is \(oneCity?.weather.fact.temp ?? 0). Fells like \(oneCity?.weather.fact.feels_like ?? 0)."
        
        data.append(Data(name: "daytime", value: oneCity?.weather.fact.daytime ?? ""))
        data.append(Data(name: "season", value: oneCity?.weather.fact.season ?? ""))
        data.append(Data(name: "wind_dir", value: "\(oneCity?.weather.fact.wind_dir ?? "")" ))
        data.append(Data(name: "humidity", value: "\(oneCity?.weather.fact.humidity ?? 0)" ))
        data.append(Data(name: "pressure_mm", value: "\(oneCity?.weather.fact.pressure_mm ?? 0)" ))
        data.append(Data(name: "pressure_pa", value: "\(oneCity?.weather.fact.pressure_pa ?? 0)" ))
        data.append(Data(name: "sunrise", value: "\(oneCity?.weather.forecast.sunrise ?? "")" ))
        data.append(Data(name: "sunset", value: "\(oneCity?.weather.forecast.sunset ?? "")" ))
        
        for i in oneCity!.weather.forecast.parts{
            forecast_parts.append(DataForecast(name: i.part_name, max: "\(i.temp_max)", min: "\(i.temp_min)", cond: i.condition))
        }
    }
}

extension WeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell;
        
            cell.initCell(item: data[indexPath.row])
        return cell;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
      
            let w = UIScreen.main.bounds.width/2
            return CGSize(width: w, height: w)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return forecast_parts.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCollectionViewCell", for: indexPath) as! ForecastCollectionViewCell
        cell.part_name.text = forecast_parts[indexPath.row].name
        cell.max_temp.text = forecast_parts[indexPath.row].max
        cell.min_temp.text = forecast_parts[indexPath.row].min
        cell.condition.text = forecast_parts[indexPath.row].cond
        
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemGray6
        
        return cell
       
    }
    

    
}
