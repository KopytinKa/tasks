//
//  TaskViewController.swift
//  Tasks
//
//  Created by Кирилл Копытин on 20.09.2021.
//

import UIKit

class TaskViewController: UIViewController {
    
    var currentTask: Task!

    @IBOutlet weak var descriptionTaskLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTaskLabel.text = currentTask.description
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tasksTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddTaskSegue" {
            guard let addTaskViewController = segue.destination as? AddTaskViewController else { return }
            addTaskViewController.parentTask = currentTask
        }
    }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTask.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "TaskCellIdentifier", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let task = currentTask.tasks[indexPath.row]
        cell.textLabel?.text = task.description
        cell.detailTextLabel?.text = String(task.tasks.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentTask = currentTask.tasks[indexPath.row]
        descriptionTaskLabel.text = currentTask.description
        tableView.reloadData()
    }
}
