
import Foundation
//
//  FoodDetailVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 30.12.2021.
//

import UIKit
class FoodDetailVC: UIViewController {
    

   var mImage: UIImage? = UIImage()
   var mTextView: UITextView? = UITextView()
    
    @IBOutlet weak var detailNav: UINavigationItem!
    @IBOutlet weak var textViewDetail: UITextView!
    @IBOutlet weak var imageDetail: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
