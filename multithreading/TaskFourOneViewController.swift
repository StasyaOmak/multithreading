//
//  TaskFourOneViewController.swift
//  multithreading
//
//  Created by Anastasiya Omak on 22/03/2024.
//

/*
 Nº1 Набрать код. Объяснить почему в первом случае ошибка а во втором ее нет. Исправить что б убрать ошибку.
 */


import UIKit

class TaskFourOneViewController: UIViewController {
    
    final class Post: Sendable {
        
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }
    
}

// Post должен подчинаяться протаколу Sendable, так как у нас есть Post на 28 строке и делаем class final 
