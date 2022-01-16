//
//  ViewController.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 1.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   
    @IBOutlet weak var dob3: UITextField!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var cteam: UITextView!
    
    //@IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tImageView: UIImageView!
    
    var tImage: UIImage? = UIImage()
    var index = 0
    
    var traineImgArray = ["01_img_squad", "02_img_benchpress", "03_img_deadlift", "04_img_overheadpress", "05_img_pulldown", "06_img_facepulls", "07_img_bicepcurl", "08_img_calfraises", "09_img_crunches", "10_img_pushups", "11_img_plank", "12_img_pullups", "13_img_lateralraises", "14_img_flatbenchdumbbellpress", "15_img_standingbarbellcurl"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTexts()
        setupEditButton()
    }
    
    func setupTexts() {
        fname.text = athleteList[currentIndex].activityName
        lname.text = athleteList[currentIndex].times
        dob3.text = athleteList[currentIndex].purpose
        cteam.text = athleteList[currentIndex].dayPeriod
        tImageView.image = UIImage(named: athleteList[currentIndex].imgName)
    
    }
    
    func validate() -> Bool{
        if(fname.text!.isEmpty || lname.text!.isEmpty || cteam.text!.isEmpty || dob3.text!.isEmpty ){
            return false
        }
        return true
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(athleteList)
            try JsonData.write(to: location)
        }catch{}
    }
    
    func setupEditButton(){
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tappedEditButton))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    func setupSaveButton(){
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(tappedSaveButton))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func tappedEditButton() {
        
        setupSaveButton()
        
        fname.isUserInteractionEnabled = true
        fname.borderStyle = .roundedRect
        fname.backgroundColor = .white
        fname.textColor = .black
        
        lname.isUserInteractionEnabled = true
        lname.borderStyle = .roundedRect
        lname.backgroundColor = .white
        lname.textColor = .black
        
        cteam.isEditable = true
        cteam.backgroundColor = .white
        cteam.textColor = .black
        
        dob3.isUserInteractionEnabled = true
        dob3.borderStyle = .roundedRect
        dob3.backgroundColor = .white
        dob3.textColor = .black

    }
    
    @objc func tappedSaveButton() {
        
        if validate() == true{
           // athleteList[currentIndex].purpose = dateFormatter.string(from: dob3.date)
            athleteList[currentIndex].purpose = dob3.text!
            athleteList[currentIndex].activityName = fname.text!
            athleteList[currentIndex].times = lname.text!
            athleteList[currentIndex].dayPeriod = cteam.text!
            
            setupEditButton()
            
            fname.isUserInteractionEnabled = false
            fname.borderStyle = .none

            lname.isUserInteractionEnabled = false
            lname.borderStyle = .none

            cteam.isEditable = false
            
            dob3.isUserInteractionEnabled = false
            
            fresult = true
            
            if fresult == true{
                writeToFile(location: subUrl!)
                fresult = false
            }
        }else {
            let alert = UIAlertController(title: "Reminder:", message: "All fields are required!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func onClickedRight(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    
    @IBAction func onClickedDetailFurther(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    
    @IBAction func onClickedGoList(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
}
