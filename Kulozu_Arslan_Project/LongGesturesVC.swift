//
//  longVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 2.01.2022.
//

import UIKit

import AVFoundation


class LongGesturesVC: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let longpressgesture = UILongPressGestureRecognizer()
        self.view.addGestureRecognizer(longpressgesture)
        longpressgesture.addTarget(self, action: #selector(clicklongpress))
    }
    
    @objc func clicklongpress()
    {
        print("Long Press Click Successfully")
        let mAlert = UIAlertController(title: "Gesture Recognizer", message: "Image double long pressed/tapped", preferredStyle: .alert)
        
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(mAlert, animated: true, completion: nil)
    }

    @IBAction func withoutprogramminggesture(_ sender: Any) {
        print("Image Long Press Gesture Click Successfully")
        let mAlert = UIAlertController(title: "All Training Sets", message: "1.Squads 2.Bench Press 3.DeadLift 4.Overhead Press 5.Pull Down 6.Face Pulls 7.Bicep Curls 8.Calf Raises 9.Crunches 10.Pushups 11.Plank 12.Pullups 13.Lateral Raises 14.Flatbench Dumbbell Press 15.Standing Barbell Curl", preferredStyle: .alert)
        
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(mAlert, animated: true, completion: nil)
    }
    
    
    
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
    @IBAction func onClicked(_ sender: Any)
    {
        AudioServicesPlaySystemSound(1104);
    }
    
    
    @IBAction func onClickedPrev(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
}
