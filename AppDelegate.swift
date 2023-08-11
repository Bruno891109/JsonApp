//
//  AppDelegate.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import Foundation
import UIKit
import CoreData

class CoreDataStack: NSObject {
    static let sharedInstance  = CoreDataStack()
    private override init() {
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores (completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {}
        })
        return container
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                let error = error as NSError
                print(error)
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        #endif
        return true
    }
}
