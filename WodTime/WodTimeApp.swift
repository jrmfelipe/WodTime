//
//  WodTimeApp.swift
//  WodTime
//
//  Created by Rey Felipe on 5/24/21.
//

import SwiftUI

@main
struct WodTimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            MainContentView()
        }
    }
}
