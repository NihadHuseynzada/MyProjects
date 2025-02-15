import Foundation
import UIKit

struct CalculatorBrain {
    var value = BmiModel().value
    var color = BmiModel().color
    var advice = BmiModel().advice
    
    mutating func calculateBMI(height: Float, weight: Float) -> Float {
        value = weight / (height*height)
        switch value {
        case ..<18.5 :
            color = UIColor.cyan
            advice = "You need to eat all things except stone"
        case 18.5...24.9 :
            color = UIColor.systemGreen
            advice = "You need to eat everything except junk food"
        default:
            color = UIColor.systemRed
            advice = "You need to eat less and go west"
        }
        return value
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", value)
    }
    
    func getAdvice() -> String {
        return advice
    }
    
    func getColor() -> UIColor {
        return color
    }
}
