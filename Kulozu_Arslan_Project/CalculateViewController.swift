//
//  CalculateViewController.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 31.12.2021.
//

import UIKit
import AVFoundation
class CalculateViewController: UIViewController {
    
    struct CalculatorManager {
        
        struct BMI {
            let value: Float
            let advice: String
            let color: UIColor
        }
        
        var bmi: BMI?
        
        func getBMIValue() -> String {
            let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
            return bmiTo1DecimalPlace
        }
        
        func getAdvice() -> String {
            return bmi?.advice ?? "No advice"
        }
        
        func getColor() -> UIColor {
            return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        mutating func calculateBMI(height: Float, weight: Float) {
            let bmiValue = weight / (height * height)

            if bmiValue < 18.5 {
                bmi = BMI(value: bmiValue, advice: "Careful to balance - Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
            } else if bmiValue < 24.9 {
                bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
            } else {
                bmi = BMI(value: bmiValue, advice: "Careful to balance - Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
            }
        }
    }

var calculatorBrain = CalculatorManager()
    

   @IBOutlet weak var heightLabel: UILabel!
   @IBOutlet weak var weightLabel: UILabel!
   @IBOutlet weak var heightSlider: UISlider!
   @IBOutlet weak var weightSlider: UISlider!
   
   override func viewDidLoad() {
       super.viewDidLoad()
   }

   @IBAction func heightSliderChanged(_ sender: UISlider) {
       let height = String(format: "%.2f", sender.value)
       heightLabel.text = "\(height)m"
   }
   
   @IBAction func weightSliderChanged(_ sender: UISlider) {
       let weight = String(format: "%.0f", sender.value)
       weightLabel.text = "\(weight)Kg"
   }
   
   @IBAction func calculatePressed(_ sender: UIButton) {
       let height = heightSlider.value
       let weight = weightSlider.value

       calculatorBrain.calculateBMI(height: height, weight: weight)
       performSegue(withIdentifier: "goToResult", sender: self)
       AudioServicesPlaySystemSound(1104);
       
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToResult" {
           let destinationVC = segue.destination as! ResultViewController
           destinationVC.bmiValue = calculatorBrain.getBMIValue()
           destinationVC.advice = calculatorBrain.getAdvice()
           destinationVC.color = calculatorBrain.getColor()
       }
   }
}




