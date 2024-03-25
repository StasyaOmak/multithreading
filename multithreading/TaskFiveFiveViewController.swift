//
//  TaskFiveFiveViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 Появилась обычная боевая задача, у вас есть сетевой сервис который легаси его менять не нужно, но все что в ViewController должно работать на async/await. 
 Измените метод fetchMessagesResult на func fetchMessages() async -> [Message] { и содержимое метода переведите на async с помощь withCheckedContinuation.
 P.S меняем только этот метод в пару строчек и вызов его в viewDidLoad тоже в пару строчек.
 */


import UIKit

final class TaskFiveFiveViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(await fetchMessages())
        }
    }
    
    func fetchMessages() async -> [Message] {
        await withCheckedContinuation { continutaion in
            networkService.fetchMessages { messages in
                continutaion.resume(returning: messages)
            }
        }
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}

class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}
