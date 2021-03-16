//
//  MainViewController.swift
//  test_white
//
//  Created by Владислав Бочаров on 15.03.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cityTable: UITableView!
    
    var searchActive : Bool = false
    var filtered:[WeatherOfCity] = []
    var weathers: [WeatherOfCity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTable.delegate = self
        cityTable.dataSource = self
        searchBar.delegate = self
        
        for i in cities {
     
            LoadModel.shared.loadWeather(city: i) { (data) in
               
                DispatchQueue.main.async {
                    self.weathers.append(data)
                    self.cityTable.reloadData()
                }
            }
        }
        print("End")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func addCity(_ sender: Any) {
        
        let alert = UIAlertController(title: "New city", message: "Add new City", preferredStyle: .alert)
        
         let saveAction = UIAlertAction(title: "Add",
          style: .default) { (action: UIAlertAction!) -> Void in
        
            let nameField = alert.textFields![0]
            let latField = alert.textFields![1]
            let lanField = alert.textFields![2]
            
            cities.append(Cities(name: nameField.text ?? "", lat: latField.text!.toDouble() ?? 0.0, lon: lanField.text!.toDouble() ?? 0.0))
            
            for i in cities {
         
                LoadModel.shared.loadWeather(city: i) { (data) in
                   
                    DispatchQueue.main.async {
                        self.weathers.append(data)
                        self.cityTable.reloadData()
                    }
                }
            }
         }
        
         let cancelAction = UIAlertAction(title: "Cancel",
           style: .default) { (action: UIAlertAction!) -> Void in
         }
        
        alert.addTextField { (textField) in
              textField.placeholder = "Enter city"
              textField.textColor = .red
          }
          alert.addTextField { (textField) in
              textField.placeholder = "Enter lat"
              textField.textColor = .blue
          }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter lon"
            textField.textColor = .blue
        }
        
         alert.addAction(saveAction)
         alert.addAction(cancelAction)
        
        present(alert,
             animated: true,
             completion: nil)
    }
    

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell;
        if(searchActive){
            cell.initCell(item: filtered[indexPath.row])
        } else {
            cell.initCell(item: weathers[indexPath.row])
        }

        return cell;
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = weathers.filter({$0.city.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
            searchActive = true
            print(filtered)
            self.cityTable.reloadData()
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if(searchActive) {
                return filtered.count
            }
            return weathers.count
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

            let newView: WeatherViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
            if(searchActive) {
                newView.oneCity = filtered[indexPath.row]
            } else{
                newView.oneCity = weathers[indexPath.row]
            }
            present(newView, animated: true, completion: nil)

        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(searchActive){
            filtered.remove(at: indexPath.row)
        } else {
            weathers.remove(at: indexPath.row)
        }
        cityTable.reloadData()
    }
}
