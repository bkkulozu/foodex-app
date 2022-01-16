//
//  ResultViewController.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 31.12.2021.
//

import  UIKit
import AVFoundation
class ResultViewController: UIViewController {
    
    var bmiValue: String?
       var advice: String?
       var color: UIColor?

       @IBOutlet weak var bmiLabel: UILabel!
       @IBOutlet weak var adviceLabel: UILabel!
       
       override func viewDidLoad() {
           super.viewDidLoad()

           bmiLabel.text = bmiValue
           adviceLabel.text = advice
       }
       
       @IBAction func recalculatePressed(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
           //AudioServicesPlaySystemSound(1053);
           AudioServicesPlaySystemSound(1103);
       }
       
    
    @IBAction func onClickedNext(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
   }


