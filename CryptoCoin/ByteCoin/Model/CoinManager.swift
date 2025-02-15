import Foundation

protocol CoinManagerDelegate {
    func refreshUI(price: Double)
}

struct CoinManager {
    var delegate : CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let keyAPI = "8F7380D1-E17B-4F9B-A1C4-24EC22212803"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR","TL"]
    
    func getCoinPrice(currency: String) {
        let resultURL = baseURL + currency + "?apikey=\(keyAPI)"
        print(resultURL)
        sendRequest(stringURL: resultURL)
    }
    
    func sendRequest(stringURL : String){
        let url = URL(string: stringURL)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!, completionHandler: taskComplated(data:response:error:))
        task.resume()
    }
    
    func taskComplated (data: Data?, response: URLResponse?, error: Error?){
        if error != nil {
            print(error!)
            return
        }
        if data != nil {
            let stringData = String(data: data!, encoding: .utf8)
            print(stringData!)
            let price = decodeJSON(data: data!)
            delegate!.refreshUI(price: price!)
        }
    }
    
     func decodeJSON (data: Data) -> Double?{
         
        let decoder =  JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let price = decodedData.rate
            print(price)
            return price
        }
        catch{
            print(error)
        }
        return nil
    }
}
