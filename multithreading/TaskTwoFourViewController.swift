//
//  TaskTwoFourViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 19/03/2024.
//

/*
Написать ответ: что выведется в консоль и объяснить почему именно так, а не иначе. После набрать код в проект и проверить.
 */

import UIKit

class TaskTwoFourViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            print("A")
            
            DispatchQueue.main.async {
                print("B")
            }
        
            print("C")
    }

}

// A, C, B
/*
 Сначало выведет "А" так как она у нас на главном потоке, "В" пойдёт в очередь так как она у нас async,
 Печатаем "С" так как она у нас на главной очереди и дальшк бкрём из очереди "В"
 */
