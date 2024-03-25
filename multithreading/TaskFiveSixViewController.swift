//
//  TaskFiveSixViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 25/03/2024.
//

/*
 А теперь этот же метод обработать через withChecked ThrowingContinuation на случай если messages.isEmpty o continuation.resume(throwing: a если не пустой то resume(returning:.
 */

/*
 if messages.isEmpty {
      continuation.resume(throwing: ...
 } else {
     resume(returning:...
 }
 */

import UIKit

enum MessagesError: Error {
    case empty
    case failedToLoad
}

final class TaskFiveSixViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                print(try await fetchMessages())
            } catch {
                print(error)
            }
        }
    }
    
    func fetchMessages() async throws -> [Message] {
        try await withCheckedThrowingContinuation { continutaion in
            networkService.fetchMessages { messages in
                if messages.isEmpty {
                    continutaion.resume(throwing: MessagesError.empty)
                } else {
                    continutaion.resume(returning: messages)
                }
            }
        }
    }
}
