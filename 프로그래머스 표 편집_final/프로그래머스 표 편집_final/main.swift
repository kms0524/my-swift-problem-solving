//
//  main.swift
//  프로그래머스 표 편집_final
//
//  Created by 강민성 on 2021/07/30.
//

import Foundation

class Node {
    
    var value: Int
    var prev: Node?
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
    
}

class DoubleLinkedList {
    
    var head: Node?
    var tail: Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func insert(value: Int) {
        
        let node = Node(value: value)
        
        if isEmpty() {
            head = node
            tail = head
        }
        
        else {
            tail?.next = node
            node.prev = tail
            tail = node
        }
    }
    
    func remove(node: Node) -> Node {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        }
        else {
            head = next
        }
        
        if let next = next {
            next.prev = prev
            return next
        }
        else {
            tail = prev
            return tail!
        }
        
    }
    
    func restore(node: Node) {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = node
        }
        else {
            head?.prev = node
            head = node
        }
        
        if let next = next {
            next.prev = node
            
        }
        else {
            tail?.next = node
            tail = node
        }
        
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {

    let linkedList = DoubleLinkedList()
    var current: Node?
    var removedNode = [Node?]()
    var answer = ""
    
    for i in 0..<n {
        linkedList.insert(value: i)
        if i == k {
            current = linkedList.tail!
        }
    }
    
    for i in cmd{
        
        let commandString = i.split(separator: " ").map{ String($0) }
        let command = commandString[0]
        
        switch command {
        
        case "D":
            
            var count = Int(commandString[1])!
            
            for _ in 0..<count {
                count -= 1
                current = current?.next
            }
            current = current == nil ? linkedList.tail : current
            
        case "U":
            
            var count = Int(commandString[1])!
            
            for _ in 0..<count {
                count -= 1
                current = current?.prev
            }
            current = current == nil ? linkedList.head : current
            
        case "C":
            removedNode.append(current)
            current = linkedList.remove(node: current!)
            
        case "Z":
            linkedList.restore(node: removedNode.removeLast()!)
            
        default:
            continue
            
        }
        
    }
    
    var stack = linkedList.head
    var array = Array(repeating: "X", count: n)
    
    while stack != nil {
        let check = stack!.value
        array[check] = "O"
        stack = stack?.next
    }
    
    answer = array.joined()
    
    return answer
}
