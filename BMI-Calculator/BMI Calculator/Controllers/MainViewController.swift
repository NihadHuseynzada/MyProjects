import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + " M"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value)) KG"
        //      = (String(format: "%.0f", sender.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        _ =  calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        performSegue(withIdentifier: "goToResultScreen", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let forwardedVC = segue.destination as! ResultViewController
        forwardedVC.bmiValue = calculatorBrain.getBMI()
        forwardedVC.advice = calculatorBrain.getAdvice()
        forwardedVC.bgColor = calculatorBrain.getColor()
    }
}

