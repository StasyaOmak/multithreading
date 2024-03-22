//
//  TaskThreeOneViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 21/03/2024.
//


/*
 Наберите весь код руками. 
 Дан сервис, через который записываем фразы в массив используя цикл.
 1) Используя DispatchQueue.global() у записывайте фразы через цикл, а не через main thread.
 2) Решить проблему потокобезопасности phrases через семафор.
 3) Решить проблему, используя actor вместо класса.
 */

import UIKit

class TaskThreeOneViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            var phrasesService = PhrasesService()
      
// 1) Используя DispatchQueue.global() у записывайте фразы через цикл, а не через main thread.
        DispatchQueue.global().async {
            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }

            // Даем потокам время на завершение работы
            // на 35 строке гонка потоков 
            Thread.sleep(forTimeInterval: 1)

            // Выводим результат
             print(phrasesService.phrases)
    }

    actor PhrasesService {
        var phrases: [String] = []
        // 2) Решить проблему потокобезопасности phrases через семафор.
        let semaphor = DispatchSemaphore(value: 1)
        
        func addPhrase(_ phrase: String) {
            semaphor.wait()
            phrases.append(phrase)
            semaphor.signal()
        }
    }

}
