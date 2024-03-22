//
//  TaskThreeSevenViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 21/03/2024.
//

/*
 Наберите весь код руками вникая.
 Сервис добавляет 10 элементов в массив сервиса, задача удалять последний Workitem чтo б в массив попали все элементы с 1 ...9 кроме 10го.
 
 */

import UIKit

class TaskThreeSevenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = ArrayAdditionService()
        for i in 1...10 {
            service.addElement(i)
        }
        service.cancelAddition()
    }
    
    // Класс, представляющий сервис операций добавления в массив
    class ArrayAdditionService {
        private var array = [Int]()
        private var pendingWorkItems = [DispatchWorkItem]()
        
        // Метод для добавления элемента в массив
        func addElement(_ element: Int) {
            // Создаем новую операцию для добавления элемента в массив
            let newWorkItem = DispatchWorkItem { [weak self] in
                self?.array.append(element)
                print("Элемент \(element) успешно добавлен в массив.")
            }
            
            // Сохраняем новую операцию
            pendingWorkItems.append(newWorkItem)
            
            // Даем пользователю время для отмены операции
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if newWorkItem.isCancelled == false {
                    print("Выполнения операции \(element)")
                }
            }
        }
        
        // Метод для отмены операции добавления элемента в массив
        func cancelAddition() {
            guard let lastWorkItem = pendingWorkItems.last else {
                print("Нет операций для отмены.")
                return
            }
            
            lastWorkItem.cancel()

        }
    }
}
