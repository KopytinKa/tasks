//
//  Task.swift
//  Tasks
//
//  Created by Кирилл Копытин on 20.09.2021.
//

import Foundation

class Task {
    let description: String
    let main: Bool
    
    var tasks: [Task] = []
    
    init(description: String, main: Bool) {
        self.description = description
        self.main = main
    }
}
