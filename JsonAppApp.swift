//
//  JsonAppApp.swift
//  JsonApp
//
//  Created by MacDev1 on 3/23/23.
//

import SwiftUI

@main
struct JsonAppApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
