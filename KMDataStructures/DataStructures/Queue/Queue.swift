//
//  Queue.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/25/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//

struct Queue<T> {
    fileprivate var list = LinkedList<T>()
    
    func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        
        list.remove(node: element)
        
        return element.value
    }
    
    func peek() -> T? {
        return list.first?.value
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        let topDivider = "---Queue---\n"
        let bottomDivider = "\n-----------\n"
        
        return topDivider + list.description + bottomDivider
    }
}
