//
//  FoodTableVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 1.01.2022.
//

import UIKit
/*
  Using Model View Controller (MVC) to implement the code

  Select Table View and set
      Prototype Cells:    1
      Style:              Grouped

  Select Table View Cell and set
      Identifier:         cell
      Accessory:          Disclosure Indicator

  For the DetailViewController create a "Present Modally Segue" from the UITableViewCell to the DetailViewController.

  Higher order functions in Swift
  https://www.appcoda.com/higher-order-functions-swift/
*/

class FoodTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    
    let mDataSource = DataSource()
    
    var imageNameArray = ["cafelore","egg", "omlette" , "wallnutmilk", "donostia", "fiveleaves", "forkeerestaurant", "haighschocolate", "fruitplate", "salad", "tunafish", "fixedsalad", "cookieplate", "fiberplate"]
    
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mDataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mDataSource.numbeOfItemsInEachSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let fruits: [Fruit] = mDataSource.fruitsInSection(indexPath.section)
        let fruit = fruits[indexPath.row]
        
        cell.textLabel?.text = fruit.name!
       // let targetSize = CGSize(width: 100, height: 100)
        cell.imageView?.image = UIImage(named: fruit.name!.lowercased())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    // Setting the header title for each section
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
     return mDataSource.getSectionLabelAtIndex(section)
     }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label : UILabel = UILabel()
        
        label.text = mDataSource.getSectionLabelAtIndex(section)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.systemYellow
        
        return label
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = getIndexPathForSelectedRow() {
            
            let fruit = mDataSource.fruitsInSection(indexPath.section)[indexPath.row]
            
            let detailViewController = segue.destination as! DetailVC
            
            detailViewController.mFruit = fruit
        }
    }
    
     // Our function to have a reference to indexPath for the TableView
    func getIndexPathForSelectedRow() -> IndexPath? {
        var indexPath: IndexPath?
        
        if mTableView.indexPathsForSelectedRows!.count > 0 {
            indexPath = mTableView.indexPathsForSelectedRows![0] as IndexPath
        }
        
        return indexPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
