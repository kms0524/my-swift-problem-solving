//
//  main.swift
//  백준 덱
//
//  Created by 강민성 on 2022/04/18.
//

import Foundation

public struct Deque<T> {
    private var array: [T?]
    private var head: Int
    private var capacity: Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        if head == 0 {
                    capacity *= 2
                    let emptySpace = [T?](repeating: nil, count: capacity)
                    array.insert(contentsOf: emptySpace, at: 0)
                    head = capacity
                }
                
                head -= 1
                array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
}

var N = Int(readLine()!)!
var arr = [String]()
var deque = Deque<String>(10001)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    
    if input[0] == "push_front" {
        deque.enqueueFront(input[1])
    }
    else if input[0] == "push_back" {
        deque.enqueue(input[1])
    }
    else if input[0] == "pop_front" {
        if deque.isEmpty {
            print(-1)
        }
        else {
            print(deque.dequeue()!)
        }
    }
    else if input[0] == "pop_back" {
        if deque.isEmpty {
            print(-1)
        }
        else {
            print(deque.dequeueBack()!)
        }
    }
    else if input[0] == "size" {
        print(deque.count)
    }
    else if input[0] == "empty" {
        if deque.isEmpty {
            print(1)
        }
        else {
            print(0)
        }
    }
    else if input[0] == "front" {
        if deque.isEmpty {
            print(-1)
        }
        else {
            print(deque.peekFront()!)
        }
    }
    else if input[0] == "back" {
        if deque.isEmpty {
            print(-1)
        }
        else {
            print(deque.peekBack()!)
        }
    }
}


