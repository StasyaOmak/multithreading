//
//  TaskFiveTwoViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 2) Чем этот вариант отличается от обычного Task {}?
 */

import UIKit

class TaskFiveTwoViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
    }
}



// Вывод будет 1, 3, 2 и в первом и во втором случае
// Код внутри замыкания Task будет выполняться в главном акторе. Task { @MainActor }
// Код внутри асинхронной задачи будет выполняться в контексте главного актора
