//
//  TaskFiveThreeViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 Набрать пример руками заменить Dispatch@ueue.global().async на Task.detached, объяснить в чем разница. 
 Далее поменять у Task.detached приоритет на priority: .userlnitiated.
 */

import UIKit

class TaskFiveThreeViewController: UIViewController {
    

    override func viewDidLoad() {
            super.viewDidLoad()
        
        print("Task 1 is finished")
       
        DispatchQueue.global().async {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        }
        
        print("Task 3 is finished")
    }
}
// Task 1 is finished, Task 3 is finished, 0...49, Task 2 is finished

/*
     import UIKit

     class TaskFiveThreeViewController: UIViewController {
         
         override func viewDidLoad() {
             super.viewDidLoad()
             
             print("Task 1 is finished")
             
             Task.detached {
                 for i in 0..<50 {
                     print(i)
                 }
                 print("Task 2 is finished")
                 print(Thread.current)
             }
             
             print("Task 3 is finished")
         }
     }
     // Также используется для запуска асинхронных задач
    // Task 1 is finished, Task 3 is finished, 0...49, Task 2 is finished
*/


/*
 import UIKit

 class TaskFiveThreeViewController: UIViewController {
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         print("Task 1 is finished")
         
         Task.detached(priority: .userInitiated) {
             for i in 0..<50 {
                 print(i)
             }
             print("Task 2 is finished")
             print(Thread.current)
         }
         
         print("Task 3 is finished")
     }
 }
// Task.detached(priority: .userInitiated) будет теперь иметь высокий приоритет выполнения
// Task 1 is finished, Task 3 is finished, 0...49, Task 2 is finished
*/
