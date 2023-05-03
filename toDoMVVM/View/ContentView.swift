//
//  ContentView.swift
//  toDoMVVM
//
//  Created by Timothy jounier on 03/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @ObservedObject var toDoListViewModel: ToDoListUserDefaultsViewModel
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Ajouter un toDo", text: $text)
                        Button(action: {
                            toDoListViewModel.add(string: text)
                        }, label: {Image(systemName: "plus.circle.fill")})
                    }
                }
                Section(header: Text("Mes To do")){
                    List {
                        ForEach(toDoListViewModel.items){ toDo in
                            HStack{
                                Text(toDo.name)
                                Spacer(minLength: 20)
                                Button(action: {toDoListViewModel.update(toDo: toDo)}, label: {
                                    self.getDoneImage(done: toDo.done)
                                })
                            }
                        }
                        .onDelete(perform: {indexSet in toDoListViewModel.delete(index: indexSet)})
                    }
                }
            }
            .navigationTitle(Text("ToDo MVVM"))
        }
    }
    
    // Fonction qui permet d'afficher si oui ou non on a valider la tâche
    func getDoneImage(done: Bool) -> some View {
        // Condition pour l'icone
        let systemeName = done ? "checkmark.square" : "x.square"
        // Condition pour la couleur
        let color: Color = done ? .green : .red
        return Image(systemName: systemeName).foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(toDoListViewModel: ToDoListUserDefaultsViewModel())
    }
}
