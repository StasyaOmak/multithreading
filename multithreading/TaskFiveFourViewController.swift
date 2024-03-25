//
//  TaskFiveFourViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 По практикуйтесь, переведите данный код на async/await.
 */

import UIKit

class TaskFiveFourViewController: UIViewController {
    

    override func viewDidLoad() {
            super.viewDidLoad()
        

        func randomD6() -> Int {
            Int.random(in: 1...6)
        }

        let result =  randomD6()
        print(result)
    }
}

/*
 import UIKit

 class TaskFiveFourViewController: UIViewController {
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         func randomD6() async -> Int {
             return Int.random(in: 1...6)
         }
         
         async {
             let result = await randomD6()
             print(result)
         }
     }
 }

 */

// 1. Определяем метод как async
// 2. Вызываем этот метод с помощью await
