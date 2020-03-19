//
//  LinkedList.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/18/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//

import Foundation

class LinkedList<T> {
    
    // MARK:- Properties
    private var head: Node<T>?
    private var tail: Node<T>?
    
    // MARK:- Nodes
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    // MARK:- Append
    func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    // MARK:- NodeAtIndex
    func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node?.next
            }
        }
        
        return nil
    }
    
    // MARK:- Remove
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        // removing
        node.next = nil
        node.previous = nil
        
        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
  // 2
  public var description: String {
    // 3
    var text = "["
    var node = head
    // 4
    while node != nil {
      text += "\(node!.value)"
      node = node!.next
      if node != nil { text += ", " }
    }
    // 5
    return text + "]"
  }
}
