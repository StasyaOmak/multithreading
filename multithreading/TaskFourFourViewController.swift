//
//  TaskFourFourViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 22/03/2024.
//

/*
 N°4 Набираем руками. Находим проблему, пишем как называется такая проблема. 
 Фиксим сначала одним способом который вы уже знаете потом вторым на ваше усмотрение.
 */

// Проблема - это Data Race 

import UIKit

class TaskFourFourViewController: UIViewController {
    
     
       override func viewDidLoad() {
           super.viewDidLoad()
          
           // Использование
           let threadSafeArray = ThreadSafeArray()
           let operationQueue = OperationQueue()

           let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
           let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)

           operationQueue.addOperation(firstOperation)
           secondOperation.addDependency(firstOperation)
           operationQueue.addOperation(secondOperation)

           // Дождитесь завершения операций перед выводом содержимого массива
           operationQueue.waitUntilAllOperationsAreFinished()

           print(threadSafeArray.getAll())
       }
   }

   // Объявляем класс для для синхронизации потоков
   class ThreadSafeArray {
       private var array: [String] = []

       func append(_ item: String) {
           array.append(item)
       }

       func getAll() -> [String] {
           return array
       }
   }

   // Определяем первую операцию для добавления строки в массив
   class FirstOperation: Operation {
       let threadSafeArray: ThreadSafeArray

       init(threadSafeArray: ThreadSafeArray) {
           self.threadSafeArray = threadSafeArray
       }

       override func main() {
           if isCancelled { return }
           threadSafeArray.append("Первая операция")
       }
   }

   // Определяем вторую операцию для добавления строки в массив
   class SecondOperation: Operation {
       let threadSafeArray: ThreadSafeArray

       init(threadSafeArray: ThreadSafeArray) {
           self.threadSafeArray = threadSafeArray
       }

       override func main() {
           if isCancelled { return }
           threadSafeArray.append("Вторая операция")
       }
   }

