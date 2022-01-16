//  CustomTableView1
//


import UIKit
class FoodsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var imageArray = ["cafelore", "donostia", "fiveleaves", "forkeerestaurant", "haighschocolate", "fruitplate", "salad", "tunafish", "fixedsalad", "cookieplate", "fiberplate"]
    
    
    var imageNameArray = ["cafelore", "donostia", "fiveleaves", "forkeerestaurant", "haighschocolate", "fruitplate", "salad", "tunafish", "fixedsalad", "cookieplate", "fiberplate"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        
        cell.mImageView.image = UIImage(named: imageArray[indexPath.row])
        
        //cell.topLabel.text = " meal "
        //cell.bottomLabel.text = " meal "
        
        if let i = imageNameArray.firstIndex(of: "donostia") {
            imageNameArray[i]
        }
        
        cell.topLabel.text = "\(imageNameArray[1])"
        cell.bottomLabel.text = "\(imageNameArray[1])"
        
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Calling our function
      //  if let indexPath = getIndexPathForSelectedCell() {
        //    let record = dataSource.itemsInCategory(index: //indexPath.section)[indexPath.row]
        
            
            let FoodDetailVC = segue.destination as! FoodDetailVC
            //FoodDetailVC.record = record
        }
    //}
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
