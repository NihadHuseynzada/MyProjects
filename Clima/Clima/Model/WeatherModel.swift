import Foundation

struct WeatherModel {
    let conditionID : Int
    let cityName : String
    let countryName: String
    let temperature : Float
    var stringTemperature : String {
        return String(format: "%.1f", temperature)
    }
    var conditionName : String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return  "cloud.rain"
        case 600...622:
            return  "cloud.snow"
        case 701...781:
            return "smoke"
        case 801...804:
            return "cloud"
        default:
            return "sun.max"
        }
    }
}
