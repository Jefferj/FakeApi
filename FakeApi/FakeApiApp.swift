//
//  FakeApiApp.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 1/09/22.
//

import SwiftUI

@main
struct FakeApiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
