//
//  DataSource.swift
//  Kulozu_Arslan_Project
//
//  Created by Beste Kulozu on 1.01.2022.
//

import Foundation

class DataSource {
    var fruits: [Fruit] = []
    var sections: [String] = []
    
    init() {
        print("Inside init()")
        populateData()
    }
    
    func numbeOfItemsInEachSection(_ index: Int) -> Int {
        return fruitsInSection(index).count
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func getSectionLabelAtIndex(_ index: Int) -> String {
        return sections[index]
    }
    
    // MARK:- Populate Data from plist
    func populateData() {
        if let path = Bundle.main.path(forResource: "fruits", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let group = dict["group"] as! String
                        
                        let fruit = Fruit(name: name, group: group)
                        fruits.append(fruit)
                        
                        if !sections.contains(group){
                            sections.append(group)
                        }
                        
                    }
                }
            }
        }
        print(sections)
    }
    
    // MARK:- FruitsForEachSection (filtering data based on section)
    func fruitsInSection(_ index: Int) -> [Fruit] {
        let item = sections[index]
        
        print()
        
        // See playground6 for Closure
        // https://www.appcoda.com/higher-order-functions-swift/
        let filteredFruits = fruits.filter { (fruit: Fruit) -> Bool in
            return fruit.group == item
        }
        
        return filteredFruits
    }
    
}

