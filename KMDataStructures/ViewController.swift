//
//  ViewController.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/18/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        testDLinkedListString()
//        testDLinkedListInt()
//        testStack()
//        testQueue()
        testHeap()
    }
    
    func testDLinkedListString() {
        let dogBreeds = LinkedList<String>()
        dogBreeds.append(value: "Labrador")
        dogBreeds.append(value: "Bulldog")
        dogBreeds.append(value: "Beagle")
        dogBreeds.append(value: "Husky")
        print("dogBreeds: \(dogBreeds)")
    }

    func testDLinkedListInt() {
        let numbersTrain = LinkedList<Int>()
        numbersTrain.append(value: 10)
        numbersTrain.append(value: 4)
        numbersTrain.append(value: 7)
        numbersTrain.append(value: 18)
        numbersTrain.append(value: 23)
        print("numbersTrain: \(numbersTrain)")
    }
    
    
    func testStack() {
        var rwBookStack = Stack<String>()
        rwBookStack.push("3D Games by Tutorials")
        rwBookStack.push("tvOS Apprentice")
        rwBookStack.push("iOS Apprentice")
        rwBookStack.push("Swift Apprentice")
        print(rwBookStack)
    }
    
    
    func testQueue() {
        let queue = Queue<Int>()
        queue.enqueue(10)
        queue.enqueue(3)
        queue.enqueue(57)
        print(queue)
        
        let queue2 = Queue<String>()
        queue2.enqueue("mad")
        queue2.enqueue("lad")
        if let first = queue2.dequeue() {
          print(first)
        }
        print(queue2)
    }

    
    func testHeap() {
        let heap = Heap(elements: [5,0,3,2,1,2]) { (first, second) -> Bool in
            print("\(first) < \(second) == \(first < second)")
            return first < second
        }
        print("heap: \(heap.elements)")
    }
}

