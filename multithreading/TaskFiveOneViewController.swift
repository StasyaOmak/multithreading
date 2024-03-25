//
//  TaskFiveOneViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 1) Набрать руками и объяснить почему так распечаталось? 2) Заменить DispatchQueue.main, async на Task и распечатать и объяснить что изменилось?
 */

import UIKit

class TaskFiveOneViewController: UIViewController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        print(1)
        DispatchQueue.main.async {
            print(2)
        }
        print(3)
    }
}

// 1, 3, 2
// блок с DispatchQueue.main.async запускается асинхронно и может быть выполнен после (3)

/*
 import UIKit

 class TaskFiveOneViewController: UIViewController {
     
     override func viewDidLoad() {
             super.viewDidLoad()
         
         print(1)
         Task {
             print(2)
         }
         print(3)
     }
 }
 */

// вывод будет такой же 1, 3, 2
// если хотим чтобы выполнялось 1, 2, 3

/*
 
 print(1)
 async {
     await Task {
         print(2)
     }
 }
 print(3)

 */
