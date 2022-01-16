//
//  AboutVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 30.12.2021.
//

import UIKit
class AboutVC: UIViewController {
    @IBOutlet weak var mLabel1: UILabel!
    @IBOutlet weak var mLabel2: UILabel!
    
    var labelText1 = String()
    var labelText2 = String()
    var labelColor1 = UIColor()
    var labelColor2 = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mLabel1.text = labelText1
        mLabel1.textAlignment = .center
        mLabel2.text = labelText2
        mLabel2.textAlignment = .center
        
        mLabel1.textColor = labelColor1
        mLabel2.textColor = labelColor2
        
    }
    
}
    
    
