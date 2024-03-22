//
//  TaskThreeFourViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 21/03/2024.
//


/*
 Написать как называется проблема Nº2 которая в коде и решить ее.
 */

// 3. Race Condition

import UIKit

class TaskThreeFourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // обращаемся из разных потоков 
        var sharedResource = 0
        
        // решаем путём лока. Потому что всё зависит от очередности, кто сработает первый 
        let lock = NSLock()
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
    }
}
