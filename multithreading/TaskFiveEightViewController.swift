//
//  TaskFiveEightViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 Наберите задачу. Разберитесь как taskGroup. Добавить в метод printMessage в group 5 строк "Hello", "My", "Road", "Map", "Group".
 */

import UIKit

class TaskFiveEightViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await printMessage()
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            // тут добавляем строки в группу
            group.addTask {
                return "Hello"
            }
            group.addTask {
                return "My"
            }
            group.addTask {
                return "Road"
            }
            group.addTask {
                return "Map"
            }
            group.addTask {
                return "Group"
            }
            
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        
        print(string)
    }
}
