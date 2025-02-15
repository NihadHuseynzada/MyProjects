import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitValue: UILabel!
    
    var tipPercentage: Float = 0
    var global_billForOnePerson : Float = 0
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.titleLabel!.text {
        case "0%":
            tipPercentage = 0
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
        case "10%":
            tipPercentage = 0.1
            tenButton.isSelected = true
            twentyButton.isSelected = false
            zeroButton.isSelected = false
        default:
            tipPercentage = 0.2
            twentyButton.isSelected = true
            zeroButton.isSelected = false
            tenButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard var totalBill: Float = Float(billTextField.text!) else {
            return
        }
        totalBill += totalBill * tipPercentage
        guard let billForOnePerson: Float? = totalBill / Float(splitValue.text!)! else {
            return
        }
        global_billForOnePerson = billForOnePerson!
        print(totalBill)
        print(billForOnePerson!)
        print(tipPercentage)
        
        performSegue(withIdentifier: "goToResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let forwardedVC = segue.destination as! ResultVC
        forwardedVC.amount = global_billForOnePerson
        forwardedVC.tipPercentage = Int(tipPercentage * 100)
        forwardedVC.totalPerson = splitValue.text!
    }
}

