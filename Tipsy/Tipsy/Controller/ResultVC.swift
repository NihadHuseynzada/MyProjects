import UIKit

class ResultVC: UIViewController {
    var amount : Float = 0
    var tipPercentage : Int = 0
    var totalPerson: String = ""
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let descriptionText: String = "Split between \(self.totalPerson) people with \(self.tipPercentage)% tip"
        amountLabel.text = String(amount)
        descriptionLabel.text = descriptionText
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
