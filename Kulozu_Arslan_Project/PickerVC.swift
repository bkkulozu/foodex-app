//
//
//  PickerView


import UIKit
import AVFoundation

class PickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerText: UILabel!
    @IBOutlet weak var pickerBtn: UIButton!
    @IBOutlet weak var mPickerView: UIPickerView!
    
    
    
    let pickList = ["Meal Details", "Training Details"]
    //var svc;
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of items/rows in the components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickList.count
    }
    
    // Called automatically multiple times. To attach the data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickList[row]
    }
    
    // Called when an item in pickerView is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var mBackgroundColor : UIColor
        
        switch row {
        case 0:
            mBackgroundColor = UIColor.systemYellow      // Write -> Color Literals
           // self.performSegueWithIdentifier("Segue0", sender: self)
        case 1:
            mBackgroundColor = UIColor.systemRed
        //case 2:
          //  mBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        default:
            mBackgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        }
        
        self.view.backgroundColor = mBackgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mPickerView.delegate = self
        mPickerView.dataSource = self
        
        self.view.backgroundColor = UIColor.white
        mPickerView.selectRow(2, inComponent: 0, animated: true)
    }
    
    @IBAction func onClickedMeal(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    @IBAction func onClickedTraning(_ sender: Any) {
        AudioServicesPlaySystemSound(1104);
    }
    
    @IBAction func onClickPicker(_ sender: Any) {
        //pickerText.text = "deneme"
        AudioServicesPlaySystemSound(1104);
        pickerText.text = pickList[1]
        }
    }


func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    if (segue.identifier == "send_data") {
        let svc = segue.destination as! FoodsVC;
        //var svc = segue.PickerVC as! FoodsVC;
        
    }
}
