//
//  TaskTwoOneViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//

/*
 Наберите весь код руками. Отменяем задачу, когда цикл while досчитает до 5. Расставить флаги из пункта выше в viewDidLoad, например,
 print (infinityThread.isExecuting, потом, например, infinityThread.isFinished)
 */

import UIKit

class TaskTwoOneViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
     
            // Создаем и запускаем поток
            let infinityThread = InfinityLoop()
            infinityThread.start()
        print("isExecuting - \(infinityThread.isExecuting)")
        print("isFinished - \(infinityThread.isFinished)")
        print("isCancelled - \(infinityThread.isCancelled)")
        
            // Подождем некоторое время, а затем отменяем выполнение потока
            sleep(5)
        
            // Отменяем тут
        if infinityThread.counter == 5 {
            infinityThread.cancel()
            sleep(2)
            print("isExecuting - \(infinityThread.isExecuting)")
            print("isFinished - \(infinityThread.isFinished)")
            print("isCancelled - \(infinityThread.isCancelled)")
        }

    }

    class InfinityLoop: Thread {
        var counter = 0
        
        override func main() {
            while counter < 30 && !isCancelled {
                counter += 1
                print(counter)
                InfinityLoop.sleep(forTimeInterval: 1)
            }
        }
    }

}
