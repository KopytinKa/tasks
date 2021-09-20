//
//  AddTaskViewController.swift
//  Tasks
//
//  Created by Кирилл Копытин on 15.09.2021.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextView: UITextView!
    
    var parentTask: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTaskTapped(_ sender: Any) {
        guard let description = taskTextView.text else { return }
        let main = parentTask == nil
        
        let newTask = Task(description: description, main: main)
        
        Tasks.shared.tasks.append(newTask)
        parentTask?.tasks.append(newTask)
        
        navigationController?.popViewController(animated: true)
    }
}
