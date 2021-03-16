
import Foundation

struct ErrorModel: Decodable {
    
}

struct Weather: Decodable {
    var now: Int
    var now_dt: String
    var info: Info
    var fact: Fact
    var forecast: Forecast
}

struct Info:Decodable {
    var url: String
    var lat: Double
    var lon: Double
}


struct Fact: Decodable {
    var obs_time: Int
    var temp: Int
    var feels_like: Int
    var icon: String
    var condition: String
    var wind_speed: Double
    var wind_dir: String
    var pressure_mm: Int
    var pressure_pa: Int
    var humidity: Int
    var daytime: String
    var polar: Bool
    var season: String
    var wind_gust: Double
}

struct Forecast: Decodable {
    var date: String
    var date_ts: Int
    var week: Int
    var sunrise: String
    var sunset: String
    var moon_code: Int
    var moon_text: String
    var parts: [Parts]
}

struct Parts: Decodable {
    var part_name: String
    var temp_min: Int
    var temp_avg: Int
    var temp_max: Int
    var wind_speed: Double
    var wind_gust: Double
    var wind_dir: String
    var pressure_mm: Int
    var pressure_pa: Int
    var humidity: Int
    var prec_mm: Double
    var prec_prob: Int
    var prec_period: Int
    var icon: String
    var condition: String
    var feels_like: Int
    var daytime: String
    var polar: Bool
}
