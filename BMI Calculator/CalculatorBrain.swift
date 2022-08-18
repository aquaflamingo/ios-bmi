import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?

    mutating func computeBMI(height: Float, weight: Float) {
        let val =  weight/pow(height,2)
        if val < 18.5 {
            // Underweight
            bmi = BMI(value: val, advice: "Eat more pies", color: UIColor.blue)
        } else if val < 24.9 {
            // Normal weight
            bmi = BMI(value: val, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            // Overweight
            bmi = BMI(value: val, advice: "Eat less pies", color: UIColor.red)
        }

    }

    func getBMIValue() -> String {
        let text = String(format: "%.2f", bmi?.value ?? 0.0)
        return text
    }

    func getBMIAdvice() -> String {
        return bmi?.advice ?? ""
    }

    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.green
    }
}
