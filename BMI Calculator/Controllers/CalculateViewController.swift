import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightSliderOutput: UILabel!
    @IBOutlet weak var weightSliderLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    var cb = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightSliderLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightSliderOutput.text = String(format: "%.2fm", sender.value)
    }
    @IBAction func computeBMI(_ sender: UIButton) {
        let h = heightSlider.value
        let w = weightSlider.value
 
        cb.computeBMI(height: h, weight: w)

        self.performSegue(withIdentifier: "resultsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue" {
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.bmiValue =  cb.getBMIValue()
            destinationVc.advice =  cb.getBMIAdvice()
            destinationVc.color =  cb.getBMIColor()
        }
    }
}

