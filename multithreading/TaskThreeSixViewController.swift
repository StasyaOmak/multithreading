//
//  TaskThreeSixViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 21/03/2024.
//

/*
 Написать как называется проблема Nº4 которая в коде и решить ее.
 */

// livelock
import UIKit

class TaskThreeSixViewController: UIViewController {
    
    
    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        DispatchQueue.global().async {
            self.thread1()
        }

        DispatchQueue.global().async {
            self.thread2()
        }
    }

    func thread1() {
        print("Поток 1 пытается захватить Ресурс A")
        resourceASemaphore.wait() // Захват Ресурса A
        
        print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        
        //resourceBSemaphore.wait() // Попытка захвата Ресурса B, который уже занят Потоком 2
        print("Поток 1 захватил Ресурс B")
        
        resourceBSemaphore.signal()
        resourceASemaphore.signal()
    }

    func thread2() {
        print("Поток 2 пытается захватить Ресурс B")
        resourceBSemaphore.wait() // Захват Ресурса B
        
        print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
        resourceASemaphore.wait()  
        // Имитация работы для демонстрации livelock
        
       // resourceASemaphore.wait() // Попытка захвата Ресурса A, который уже занят Потоком 1
        print("Поток 2 захватил Ресурс A")
        
        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
}
