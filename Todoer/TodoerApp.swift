//
//  TodoerApp.swift
//  Todoer
//
//  Created by 冯旭超 on 2021/9/2.
//

import SwiftUI

@main
struct TodoerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
