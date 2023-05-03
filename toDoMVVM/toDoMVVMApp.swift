//
//  toDoMVVMApp.swift
//  toDoMVVM
//
//  Created by Timothy jounier on 03/05/2023.
//

import SwiftUI

@main
struct toDoMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toDoListViewModel: ToDoListUserDefaultsViewModel())
        }
    }
}
