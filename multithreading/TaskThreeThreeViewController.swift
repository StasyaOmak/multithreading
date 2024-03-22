//
//  TaskThreeThreeViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 21/03/2024.
//

/*
 Написать как называется проблема Nº1 которая в коде и решить ее.
 */
// 1. DeadLock
// 2. LifeLock
// 3. Race Condition
// 4. Starvation
// 5. Priorety invertion



// 1. У нас DeadLock
import UIKit

class TaskThreeThreeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Serial
        let serialQueue = DispatchQueue(label: "com.example.myQueue")
        
        serialQueue.async {
            // делаем здесь async. Без этого она ждёт завершения sync
            serialQueue.sync {
                print("This will never be printed.")
            }
        }
    }
}
