//
//  ToDo.swift
//  toDoMVVM
//
//  Created by Timothy jounier on 03/05/2023.
//

import Foundation


struct ToDo: Identifiable, Codable {
    var id = UUID()
    var name: String
    var done: Bool
}

