//
//  Stack.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/22/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//


struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map{ "\($0)" }.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}
