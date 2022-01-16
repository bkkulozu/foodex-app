//
//  MealsTableTVC.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 5.01.2022.
//


import UIKit
// We will use the code to attach the UISearchController to the UITableViewController

class MealsTableTVC: UITableViewController {
    var candies = [MealTable]()
    var filteredCandies = [MealTable]()
    // We want to display the search results in the same view controller that displays the searchable contents
    let mSearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Shifting the tableview down
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // Setup the Search Results Delegate (to track changes inside the search bar)
        mSearchController.searchResultsUpdater = self
        
        // Returns an accessory view that is displayed above the table.
        // The default value is nil. The table header view is different from a section header.
        tableView.tableHeaderView = mSearchController.searchBar
        
        // Setup the Search Bar Delegate
        mSearchController.searchBar.delegate = self
        
        // A Boolean value that indicates whether this view controller's view is covered when the view controller or one of its descendants presents a view controller
        definesPresentationContext = false
        
        // A Boolean indicating whether the underlying content is dimmed during a search
        mSearchController.dismiss(animated: false, completion: nil)
        
        mSearchController.searchBar.placeholder = "Search meals and calories ..."
        mSearchController.searchBar.tintColor = UIColor.systemYellow
        mSearchController.searchBar.barTintColor = UIColor.systemYellow
        
        // Setup the Scope Bar
        mSearchController.searchBar.scopeButtonTitles = ["All", "Salad","Breakfast", "Fruit", "Meal", "Fiber", "Soup", "Other"]
        
        candies = [
            MealTable(category:"Breakfast", name:"Omlette x 1 plate ", kcal: "154 kcal"),
            MealTable(category:"Breakfast", name:"Egg x 2", kcal: "155 kcal"),
            MealTable(category:"Breakfast", name:"Veggie Breakfast Tacos x 1 plate ", kcal: "178 kcal"),
            
            
            MealTable(category:"Salad", name:"Fixed Salad x 1 cup", kcal: "64 kcal"),
            MealTable(category:"Salad", name:"Tuna Fish Salad x 1 cup", kcal: "186 kcal"),
            MealTable(category:"Salad", name:"Harvest Cobb Salad x  1 cup", kcal: "125 kcal"),
            
            
            
            MealTable(category:"Fruit", name:" Fruit Platter", kcal: "50-55  kcal"),
            MealTable(category:"Fruit", name:" Avacado Fruit salad: 1/2 cup Turkish yogurt, 2 tablespoons honey, 1 teaspoon grated lemon zest", kcal: "439 kcal"),
            
            
            MealTable(category:"Meal ", name:" Thai noodle with salmon",kcal: "123 kcal" ),
            
            
            MealTable(category:"Cookies ", name:" Mixed Cookie Platter",kcal: "112 kcal" ),
            MealTable(category:"Cookies ", name:" Walnut with Milk ",kcal: "120 kcal" ),
            MealTable(category:"Cookies ", name:" Pistachio with vanilla ice cream", kcal: "104 kcal"),
            
            
            MealTable(category:"Soup", name:"Winter vegetable lentil soup", kcal: "264 kcal"),
            MealTable(category:"Soup", name:"Broccoli and stilon soup", kcal: "168 kcal"),
            MealTable(category:"Soup", name:"Meatball and Tomato soup", kcal: "264 kcal"),
            MealTable(category:"Soup", name:"Chicken and sweatcorn soup", kcal: "156 kcal"),
            
            
            MealTable(category:"Fiber", name:"Bean with patatoes", kcal: "114 kcal"),
            MealTable(category:"Fiber", name:"Lentil Fritters", kcal: "356 kcal"),
            MealTable(category:"Fiber", name:"Quinoa and black beans ", kcal: "119 kcal"),
            MealTable(category: "Fiber", name: "Rolled Oats", kcal: "67,6"),
            
            
            MealTable(category:"Other", name:"Tuna Fish", kcal: "134 kcal"),
            MealTable(category:"Other", name:"Green Smoothie", kcal: "120 kcal"),
            MealTable(category:"Other", name:"Caffee latte", kcal: "34 kcal")]
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if mSearchController.isActive && mSearchController.searchBar.text != "" {
            return filteredCandies.count
        }
        
        return candies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let candy: MealTable
        
        // isEmpty can also be used
        if mSearchController.isActive && mSearchController.searchBar.text != "" {
            candy = filteredCandies[indexPath.row]
        }
        else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel!.text = candy.name
        cell.detailTextLabel!.text = candy.category +  " " + candy.kcal
        return cell
    }
    
    // Our function to perform filtering
    func filterContentForSearchText(_ searchText: String, scope: String) {
        //print(searchText)
        //print(scope)
        filteredCandies = candies.filter({( candy : MealTable) -> Bool in
            let categoryMatch = (scope == "All") || (candy.category == scope)
            //print(candy.name.lowercased().contains(searchText.lowercased()))
            return ( categoryMatch && candy.name.lowercased().contains(searchText.lowercased()) )
        })
        
        // print(filteredCandies)
        
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let candy: MealTable
                
                if mSearchController.isActive && mSearchController.searchBar.text != "" {
                    candy = filteredCandies[indexPath.row]
                }
                else {
                    candy = candies[indexPath.row]
                }
            }
        }
    }
    
}

extension MealsTableTVC: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    
    // Tells the delegate that the scope button selection changed
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension MealsTableTVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    
    // Called when the search bar becomes the first responder or when the user makes changes inside the search bar.
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        //print(scope)
        filterContentForSearchText(searchController.searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines), scope: scope)
    }
}
