
import Foundation

struct Cities{
    var name: String
    var lat: Double
    var lon: Double
}

struct WeatherOfCity {
    var city: Cities
    var weather: Weather
}

var cities: [Cities] = [Cities(name: "Aleksin", lat: 54.5072013, lon: 37.0013226),
                        Cities(name: "Adler", lat: 43.4343234, lon: 39.9339462),
                        Cities(name: "Pavlovo", lat: 55.9545317, lon: 43.0818506),
                        Cities(name: "Aleksandrov", lat: 56.3947309, lon: 38.712037),
                        Cities(name: "Zarinsk", lat: 53.7273796, lon: 84.9265074),
                        Cities(name: "Yurga", lat: 55.7297643, lon: 84.8944519),
                        Cities(name: "Yekaterinburg", lat: 56.8389261, lon: 60.6057025),
                        Cities(name: "Vorkuta", lat: 67.4968967, lon: 64.0602175),
                        Cities(name: "Verkhnyaya Pyshma", lat: 56.9664827, lon: 60.5864162),
                        Cities(name: "Zelenogorsk", lat: 56.1124, lon: 94.5985),
                        Cities(name: "Tyumen", lat: 57.1612975, lon: 65.5250172),
                        Cities(name: "Troitsk", lat: 54.0747574, lon: 61.567051),
                        Cities(name: "Tomsk", lat: 56.5010397, lon: 84.9924506),
                        Cities(name: "Tobolsk ", lat: 58.200024, lon: 68.2635228),
                        Cities(name: "Talnakh", lat: 69.5, lon: 88.4),
                        Cities(name: "Surgut", lat: 61.2559503, lon: 73.3845471)
]

extension String {
func toDouble() -> Double? {
    return NumberFormatter().number(from: self)?.doubleValue
 }
}

