//
//  AppDelegate.swift
//  Tasks
//
//  Created by Кирилл Копытин on 15.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let task1 = Task(description: "Task 1", main: true)
        let task2 = Task(description: "Task 2", main: true)
        let task3 = Task(description: "Task 3", main: true)
        let task4 = Task(description: "Task 4", main: true)
        let task5 = Task(description: "Task 5", main: true)
        let task6 = Task(description: "Task 6", main: true)
        let task7 = Task(description: "Task 7", main: false)
        let task8 = Task(description: "Task 8", main: false)
        let task9 = Task(description: "Task 9", main: false)
        let task10 = Task(description: "Task 10", main: false)
        task1.tasks = [task8, task9, task10]
        task10.tasks = [task7]
        
        Tasks.shared.tasks = [task1, task2, task3, task4, task5, task6, task7, task8, task9, task10]
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

