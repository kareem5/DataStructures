//
//  Node.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/18/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//

class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
