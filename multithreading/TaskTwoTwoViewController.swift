//
//  TaskTwoTwoViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//

/*
Наберите весь код руками. 1) Выставить правильные приоритеты, чтобы сначала печатали 1, потом 2. 2) Изменить приоритеты: 2 потом 1. 3)
Поменять приоритет, чтобы печаталось вперемешку
 */

import UIKit

class TaskTwoTwoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        
        // Меняем приоритеты
        thread1.qualityOfService = .background
        thread2.qualityOfService = .userInitiated
        
        thread1.start()
        thread2.start()
        
        // Меняем приоритеты ещё раз (1, 2)
//        thread1.qualityOfService = .default
//        thread2.qualityOfService = .background
        
        // Меняем приоритеты ещё раз вперемешку
//        thread1.qualityOfService = .default
//        thread2.qualityOfService = .default

        
    }
    
    class ThreadprintDemon: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1")
            }
        }
    }
    class ThreadprintAngel: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2")
            }
        }
    }
}
