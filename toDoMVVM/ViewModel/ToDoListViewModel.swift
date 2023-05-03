//
//  ToDoListViewModel.swift
//  toDoMVVM
//
//  Created by Timothy jounier on 03/05/2023.
//

import Foundation

// Non enregistrement des datas à la fermeture de l'application
class ToDoListViewModel: ObservableObject {
    @Published var items: [ToDo] = []
    var stringArray: [String] = []
    
    init() {
        items = stringArray.map({string in
            ToDo(name: string, done: false)
        })
    }
    
    // Update a todo
    func update(toDo: ToDo) {
        guard let index = items.firstIndex(where: {$0.id == toDo.id}) else {return}
        items[index].done.toggle()
    }
    
    // Add a todo
    func add(string: String) {
        guard string != "" else {return}
        items.append(ToDo(name: string, done: false))
    }
    
    // Delete a todo
    func delete(index: IndexSet) {
        items.remove(atOffsets: index)
    }
}
