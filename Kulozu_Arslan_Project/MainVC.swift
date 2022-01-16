//
//  ViewController.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 30.12.2021.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {
    
    
    func setBackground() {
        // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to the size of display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        gradientLayer.colors = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor, #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the view.
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func unwindSegue (_sender: UIStoryboardSegue ) {
        
    }
    
    
    @IBAction func onClickedGetStarted(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutID" {
            let destinationController = segue.destination as! AboutVC
            destinationController.labelText1 = "About "
            destinationController.labelText2 = "CTIS 480: Project"
            destinationController.labelColor1 = UIColor.systemYellow
            destinationController.labelColor2 = UIColor.black
        }
    }
    @IBAction func onClickedInfo(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1050);
    }
    @IBAction func onClickedData(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
}
