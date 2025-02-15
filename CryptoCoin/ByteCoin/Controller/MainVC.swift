import UIKit

class MainVC: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate, CoinManagerDelegate{
    
    var coinManagerSTRUCT = CoinManager()
    var selectedCurrencyPUBLIC = ""
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManagerSTRUCT.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func refreshUI(price: Double) {
        DispatchQueue.main.async {
            self.priceLabel.text = String(format: "%.3f", price)
            self.currencyLabel.text = self.selectedCurrencyPUBLIC
        }
    }
    
    // **PickerView Functions**
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManagerSTRUCT.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManagerSTRUCT.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManagerSTRUCT.currencyArray[row]
        selectedCurrencyPUBLIC = selectedCurrency
        coinManagerSTRUCT.getCoinPrice(currency: selectedCurrency)
    }
    // **PickerView Functions**
}

