import UIKit

class ViewController2: UIViewController {
    var bmiValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.backgroundColor = .systemIndigo
        view.addSubview(label)
        label.text = bmiValue
        
        
        
    }
}
