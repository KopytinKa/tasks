//
//  AllTasksViewController.swift
//  Tasks
//
//  Created by Кирилл Копытин on 15.09.2021.
//

import UIKit

class AllTasksViewController: UIViewController {

    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Сделать хранение задач в Realm (например)
        self.tasks = []
        
        for task in Tasks.shared.tasks {
            if task.main {
                self.tasks.append(task)
            }
        }
        
        tasksTableView.reloadData()
    }
}

extension AllTasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "TaskCellIdentifier", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.description
        cell.detailTextLabel?.text = String(task.tasks.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTaskSegue" {
            guard let taskViewController = segue.destination as? TaskViewController else { return }
            
            guard let indexPath = sender as? IndexPath else { return }
            let task = tasks[indexPath.row]
            
            taskViewController.currentTask = task
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showTaskSegue", sender: indexPath)
    }
}

