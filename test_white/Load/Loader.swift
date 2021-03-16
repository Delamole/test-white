

import Foundation
import UIKit

class LoadModel: NSObject {
    
    static var shared = LoadModel()
    
    func loadWeather (city: Cities, completion: @escaping (WeatherOfCity) -> Void){
        Loader().fetch(structData: Weather.self, url: "\(url_api)lat=\(city.lat)&lon=\(city.lat)", httpMethod: HttpMethod.get, parameters: nil, completion: { (weather) in
            DispatchQueue.main.async {
                            completion(WeatherOfCity(city: city, weather: weather))
                        }
                },
                   completionError: {
                       (errorReq) in
                       print("errorReq: \(errorReq)")
                   })
    }
}

