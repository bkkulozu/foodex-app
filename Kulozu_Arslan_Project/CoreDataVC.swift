import UIKit
import CoreData         // Need to import CoreData
import AVFoundation

// A simple code to demonstrate the use of Core Data. Not a recommended way to use Core Data.
// See CoreData2 code as it is the preferred way of doing things.

// Create a Single View Application and select Core Data checkbox
// Select CoreData1.xcdatamodeld and Add a Person Entity with a name(String) attribute
// Select CoreData1.xcdatamodeld -> Person Entity -> Data Model Inspector -> Set
// Class
//      Codegen: Manual/None

// Getting started with Core Data tutorial
// http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial

// Error Handling in Swift 4.2
// https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html

// The GUI contains a TableView inside a NavigationController

class CoreDataVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    
    @IBOutlet weak var mTableView: UITableView!
    var people = [NSManagedObject]()
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let mAlert = UIAlertController(title: "New notes", message: "Add your notes here", preferredStyle: .alert)
        
        // Adds a text field to an alert
        mAlert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: { (action: UIAlertAction) -> Void in
                                        
                                        let mTextField = mAlert.textFields!.first
                                        self.saveName(mTextField!.text!)
                                        
                                        // OR
                                        //let mTextField = mAlert.textFields![0]
                                        //self.saveName(mTextField.text!)
                                        
                                        
                                        self.mTableView.reloadData()
        })
        
        // See Playground6 for Closure
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        mAlert.addAction(saveAction)
        mAlert.addAction(cancelAction)
        
        present(mAlert, animated: true, completion: nil)
    }
    
    func saveName(_ info: String) {
        //1
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //2 (Specifying the entity name and preparing to insert data into Core Data)
        let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //3 (inserting data into Core Data)
        person.setValue(info, forKey: "info")
        
        //4
        do {
            // Saving the data in Core Data
            try managedContext.save()
            //5
            people.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        // Recommended way
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let person = people[indexPath.row]
        cell.textLabel?.text = person.value(forKey: "info") as? String
        
        return cell
    }
    
    // Deleting Table rows and Core Data entry/record
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete  {
            
            let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            // Be careful delete order is IMPORTANT!
            
            // Delete it from the managedObjectContext
            managedContext.delete(people[indexPath.row])
            
            // Delete it from people Array
            people.remove(at: indexPath.row)
            
            
            // Save your changes
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
            
            // Delete it from the Table View
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "\"Add your notes\""
    }
    
    // To load data from Core Data when the application opens
    override func viewWillAppear(_ animated: Bool) {
        //1
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        //3
        do {
            let results = try managedContext.fetch(fetchRequest)
            people = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
   
    @IBAction func onClickedGoBack(_ sender: Any) {
        
        AudioServicesPlaySystemSound(1104);
    }
    
    
}
