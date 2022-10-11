//
//  AddBookmark.swift
//  TravelGuideApp
//
//  Created by Gülzade Karataş on 11.10.2022.
//

import Foundation
import CoreData

protocol AddNewItemModelProtocol: AnyObject {
    func didDataAddProcessFinish(_ isSuccess: Bool)
}


class AddNewItemModel {
    weak var delegate: AddNewItemModelProtocol?
    
    func addItem(name: String, details: String) {
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        
        let data = Item(context: managedContext)
      data.setValue(UUID(), forKey: "itemId")
        data.setValue(name, forKey: #keyPath(Item.name))
        data.setValue(details, forKey: #keyPath(Item.detail))
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
        print("eklendisfaf")
        delegate?.didDataAddProcessFinish(true)
        
    }
}
 
