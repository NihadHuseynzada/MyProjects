import Foundation
//{
//  "coord": {
//    "lon": 49.892,
//    "lat": 40.3777
//  },
//  "weather": [
//    {
//      "id": 800,
//      "main": "Clear",
//      "description": "clear sky",
//      "icon": "01d"
//    }
//  ],
//  "base": "stations",
//  "main": {
//    "temp": 23.03,
//    "feels_like": 22.59,
//    "temp_min": 23.03,
//    "temp_max": 23.03,
//    "pressure": 1019,
//    "humidity": 46,
//    "sea_level": 1019,
//    "grnd_level": 1018
//  },
//  "visibility": 10000,
//  "wind": {
//    "speed": 3.09,
//    "deg": 130
//  },
//  "clouds": {
//    "all": 0
//  },
//  "dt": 1727677146,
//  "sys": {
//    "type": 1,
//    "id": 8841,
//    "country": "AZ",
//    "sunrise": 1727663750,
//    "sunset": 1727706285
//  },
//  "timezone": 14400,
//  "id": 587084,
//  "name": "Baku",
//  "cod": 200
//}
struct WeatherData: Codable {
    let name : String
    let main : Main
    let weather : [Weather]
    let sys : Sys
}

struct Main: Codable {
    let temp : Float
}

struct Weather: Codable {
    let id : Int
    let description: String
}

struct Sys: Codable {
    let country : String
}
