//
//  Heap.swift
//  KMDataStructures
//
//  Created by Kareem Ahmed on 3/26/20.
//  Copyright © 2020 Kareem Ahmed. All rights reserved.
//


struct Heap<Element> {
    var elements: [Element]
    var priorityFunction: (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    
    // MARK:- Helper functions
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(_ index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(_ index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // MARK:- Priority functions
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    /// Compares the highest priority between the child and parent indexes and return the ghiest value of them.
    /// - Parameters:
    ///   - parentIndex: Parent index value
    ///   - childIndex: Child index value
    func highestPriorityIndex(of parentIndex: Int, and  childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    /// Return which index is higher, is it parent, left child or right child index
    /// - Parameter parent: Parent index value
    func highestPriorityIndex(for parent: Int) -> Int {
        let highestForParentAndLeftIndex: Int = highestPriorityIndex(of: parent, and: leftChildIndex(parent))
        let highestForParentAndRightIndex: Int = highestPriorityIndex(of: parent, and: rightChildIndex(parent))
        return highestPriorityIndex(of: highestForParentAndLeftIndex, and: highestForParentAndRightIndex)
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    // MARK-: Enqueue
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
}
