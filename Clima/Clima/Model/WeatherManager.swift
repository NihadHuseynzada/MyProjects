import Foundation
import CoreLocation
import UIKit

protocol WeatherManagerDelegate {
    func updateWeather(_ weatherManager: WeatherManager, weatherModel: WeatherModel)
    func identifyError (error: Error)
}

struct WeatherManager {
    var delegate : WeatherManagerDelegate?
    let apiKey = "124b2f8974d5af7fd28822241e7f9a9d"
    var stringURL = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid="
    mutating func getLocationInfoAndCreateURL(cityName: String?, lat: Double?, lon: Double?) {
        switch cityName {
        case "":
            stringURL += apiKey + "&q=" + "Baku"
        case nil:
            stringURL += apiKey + "&lat=\(lat!)&lon=\(lon!)"
        default:
            stringURL += apiKey + "&q=" + cityName!
        }
        print(stringURL)
        sendRequest(stringURL)
        stringURL = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid="
    }
    
    func sendRequest (_ stringURL : String) {
        // 1) Create url via stringURL
        let url = URL(string: stringURL)
        // 2) Create a session for Sending a Request
        let session = URLSession(configuration: .default)
        // 3) Create a task for the session
        let task = session.dataTask(with: url!, completionHandler:  taskCompleted(data: response: error:))
        // 4) Start/Resume the task
        task.resume()
    }
    
    func taskCompleted (data: Data?, response: URLResponse?, error: Error?) {
        if error != nil{
            delegate?.identifyError(error: error!)
            return
        }
        if let safeData = data {
            if let weatherModel = self.decodeJSON(safeData)
            {
                delegate?.updateWeather(self, weatherModel: weatherModel)
            }
        }
        
    }
    func decodeJSON (_ receivedData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: receivedData)
            let weatherID = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let countryName = decodedData.sys.country
            let weatherModel = WeatherModel(conditionID: weatherID, cityName: cityName, countryName: countryName, temperature: temp)
            return weatherModel
        }
        catch{
            delegate?.identifyError(error: error)
            return nil
        }
    }
}

