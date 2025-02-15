import UIKit
import CoreLocation

class WeatherVC: UIViewController, WeatherManagerDelegate
{
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        let cityName = searchTextField.text
        weatherManager.getLocationInfoAndCreateURL(cityName: cityName!, lat: nil, lon: nil)
        searchTextField.endEditing(true)
        searchTextField.placeholder = cityName
        searchTextField.text = ""
        searchTextField.placeholder = "Search a city..."
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
        searchTextField.placeholder = "Your current location"
    }
    
    func identifyError(error: Error) {
        print(error)
    }
    
    func updateWeather(_ weatherManager: WeatherManager, weatherModel: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherModel.stringTemperature
            self.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
            self.cityLabel.text = weatherModel.cityName + ", " + weatherModel.countryName
        }
    }
}

extension WeatherVC:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.getLocationInfoAndCreateURL(cityName: nil, lat: lat, lon: lon)
            print(lat, lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}



