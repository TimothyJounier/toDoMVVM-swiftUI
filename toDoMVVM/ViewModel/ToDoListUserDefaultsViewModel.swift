//
//  ToDoListUserDefaultsViewModel.swift
//  toDoMVVM
//
//  Created by Timothy jounier on 03/05/2023.
//

import Foundation
import SwiftUI

// Enregistrement des datas à la fermeture de l'application, vous retrouverez exactement les infos dans la todoList après fermeture de l'app
class ToDoListUserDefaultsViewModel: ObservableObject {
    @Published var items: [ToDo] = []
    let ud = UserDefaults.standard
    let key = "KEY"
    
    init(){
        guard let datas = ud.data(forKey: key) else {return}
        do {
            items = try JSONDecoder().decode([ToDo].self, from: datas)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Synchronique les données
    func sync() {
        do {
            let encoded = try JSONEncoder().encode(items)
            ud.set(encoded, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update(toDo: ToDo){
        guard let index = items.firstIndex(where: {$0.id == toDo.id}) else {return}
        items[index].done.toggle()
        sync()
    }
    
    func add(string: String) {
        items.append(ToDo(name: string, done: false))
        sync()
    }
    
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
        sync()
    }
}
