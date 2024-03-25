//
//  TaskTwoSixViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//

/*
Написать какая тут проблема. Набрать пример руками. С помощью Thread Sanitizer найти проблему и описать ее. Поле решить проблему с
помощью var lock = NSLock).
*/


import UIKit

class TaskTwoSixViewController: UIViewController {

    private lazy var name = "I love RM"
        var lock = NSLock()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            updateName()
        }
  
        func updateName() {
            DispatchQueue.global().async {
                self.lock.lock()
                print(self.name) // Считываем имя из global
                print(Thread.current)
                self.lock.unlock()
            }
            
            self.lock.lock()
            print(self.name) // Считываем имя из main
            self.lock.unlock()
        }

}

// оборачиваем get или set в self.lock.lock() и self.lock.unlock() чтобы исключить data race
