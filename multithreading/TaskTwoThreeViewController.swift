//
//  TaskTwoThreeViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//
/*
Набрать пример руками. Объяснить почему вывелся именно такое порядок в консоле. Теперь DispatchQueue.global().async изменить async на sync и объяснить почему консоль отображается именно так. Следующий шаг syn верните на async и с помощью инструмента Thread Sanitizer найдите проблему этого кода и решите ее с помощью private let lockQueue = DispatchQueue(label: "name.lock.queue").
 */

import UIKit

class TaskTwoThreeViewController: UIViewController {
    private var name = "Введите имя"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
    func updateName() {
        DispatchQueue.global().async {
            self.name = "I love RM" // Перезаписываем имя в другом потоке
            print(Thread.current)
            print(self.name)
        }
        
        
        print("на главном потоке \(self.name)") // Считываем имя из main
    }
}

// sync
// self.name вызывается с global().async и с main, а с двух потоков вызывать не безопастно.

/*
lockQueue.sync{
    self.name = "I love RM" // Перезаписываем имя в другом потоке
    print(Thread.current)
    print(self.name)
}

lockQueue.sync{
    print("на главном потоке \(self.name)") // Считываем имя из main
}
*/
