//
//  TaskTwoFiveViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//

/*
Написать, что выведется в консоль. Набрать код руками именно в плейграунд, посмотреть что распечатает. Ответить почему вызвался метод viewDidLoad вообще, мы же его не вызывали? Поправить код, чтобы распечатались все принты.
*/

import UIKit

class TaskTwoFiveViewController: UIViewController {
     override func viewDidLoad() {
              super.viewDidLoad()
              print(2)
              DispatchQueue.main.async {
                      print(3)
                      // меняем sync на async
                      DispatchQueue.main.sync {
                            print(5)
                      }
               print(4)
             }
           print(6)
     }
}

let vc = TaskTwoFiveViewController()
print(1)
let view = vc.view
print(7)


//1, 2, 6, 7, 3, 4, 5

/*
DispatchQueue.main.sync print(5)
Главный поток будет ждать завершения синхронного блока, который не может начаться, потому что главный поток занят ожиданием из-за этого выволится ошибка
*/
