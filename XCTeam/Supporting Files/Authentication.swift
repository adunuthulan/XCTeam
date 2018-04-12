//
//  Authentication.swift
//  XCTeam
//
//  Created by Nirav Adunuthula on 2/25/18.
//  Copyright © 2018 Nirav Adunuthula. All rights reserved.
//

import UIKit

class Authentication: NSObject {
    //finds an open URL and saves a file to it
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
        
    }()
    
    fileprivate var items: [String] = []
    override init(){
        super.init()
        loadItems()
    }
    
    //must convert [String] to NSArray to use .write(to: URL, atomically: Bool)
    func saveItems(){
        let itemsArray = items as NSArray
        
        print("Saving Array of items")
        if !itemsArray.write(to: fileURL, atomically: true){
            print("Could not save items")
        }
    }
    
    //must convert NSArray back to type Array
    func loadItems(){
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String]{
            items = itemsArray
        }
    }
    
    func add(_ item: String){
        items.append(item)
        saveItems()
    }
}
