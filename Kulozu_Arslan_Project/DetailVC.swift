//
//  DetailVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 1.01.2022.
//s
import UIKit
import AVFoundation
class DetailVC: UIViewController {
    
    var factIndex = 0
    
    var mFruit: Fruit?
    
    var mealList: [Mls] = []
    var currentIndex = 0
    var fm = FileManager.default
    var fresult: Bool = false
    var subUrl: URL?
    var mainUrl: URL? = Bundle.main.url(forResource: "Calories", withExtension: "json")
    
    @IBOutlet weak var mImageView: UIImageView!
    
    
    @IBOutlet weak var mealTextView: UITextView!
    
    @IBAction func onDoubleTap(_ sender: UITapGestureRecognizer) {
        let mAlert = UIAlertController(title: "Gesture Recognizer", message: "Image double tapped", preferredStyle: .alert)
        
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(mAlert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
       //self.mealTextView.reloadData()
        getData()
        super.viewDidLoad()
    
        
        var imageNameArray = ["cafelore","egg", "vm", "omlette", "wallnutmilk", "donostia", "fiveleaves", "forkeerestaurant", "haighschocolate", "fruitplate", "salad", "tunafish", "fixedsalad", "cookieplate", "fiberplate", "cweatcornsoup", "meatomatosoup"]
        
        var mealNameArray = ["cafelore","egg","vm", "omlette", "wallnutmilk", "donostia", "fiveleaves", "forkeerestaurant", "haighschocolate", "fruitplate", "salad", "tunafish", "fixedsalad", "cookieplate", "fiberplate","cweatcornsoup", "meatomatosoup"]
        
        // Do any additional setup after loading the view.
        if let fruit = mFruit {
            mImageView.image = UIImage(named: fruit.name!.lowercased())
            
        }
    }
    

    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("Calories.json")
           loadFile(mainPath: mainUrl!, subPath: subUrl!)
            //self.mealTextView.text = "\(Mls.self as! NSArray)"
           // self.mealTextView.text = "\(Mls.self as! [[String: AnyObject]])"
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            
            if mealList.isEmpty{
                decodeData(pathName: mainPath)
            }
            
        }else{
            decodeData(pathName: mainPath)
        }
    
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            mealList = try decoder.decode([Mls].self, from: jsonData)
        } catch {}
    }
    
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickedPrevious(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    
    @IBAction func onClickedCalories(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
        
    }

}

