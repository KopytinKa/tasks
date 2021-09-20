//
//  Tasks.swift
//  Tasks
//
//  Created by Кирилл Копытин on 20.09.2021.
//

import Foundation

final class Tasks {
    static let shared = Tasks()
    
    private init() {}
    
    var tasks: [Task] = []
}
