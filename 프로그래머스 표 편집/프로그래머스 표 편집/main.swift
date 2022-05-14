//
//  main.swift
//  프로그래머스 표 편집
//
//  Created by 강민성 on 2021/07/27.
//

import Foundation

struct Stack<T> {
    
    var list : [T]
    var from = 0
    var to = 0
    
    func size() -> Int {
        return to - from
    }
    
    func isEmpty() -> Bool {
        return size() == 0 ? true : false
    }
    
    mutating func push(_ element: T) {
        to += 1
        list.append(element)
    }
    
    mutating func pop() -> T? {
        if isEmpty() {
            return nil
        }
        
        else {
            let target = list[to]
            from += 1
            return target
        }
    }
}

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {
        
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func size() -> Int {
        guard var node = self.head else {
            return 0
        }
        
        var count = 1
        
        while node.next != nil {
            count += 1
            node = node.next!
        }
        return count
    }
    
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail?.next
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    mutating func insert(_ value: Value, after node: Node<Value>) {
        guard tail !== node else {
            append(value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
}


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var linkedList : LinkedList<Int> = LinkedList()
    var stack : [Int] = []
    var answer = ""
    
    for i in 0..<n {
        linkedList.append(i)
    }
    
    var currentIdx = k
    
    for i in 0..<cmd.count {
        
        
        if cmd[i].contains("D") {
            
            var splitArray = cmd[i].split(separator: " ").map{ String($0) }
            var selectedIdx: Int = Int(splitArray[1])!
            
            currentIdx += selectedIdx
            print("아래로 \(selectedIdx) 만큼 이동해서 현재 인덱스는 \(currentIdx)이다")
        }
        
        else if cmd[i].contains("U") {
            
            var splitArray = cmd[i].split(separator: " ").map{ String($0) }
            var selectedIdx: Int = Int(splitArray[1])!
            
            currentIdx -= selectedIdx
            print("위로 \(selectedIdx) 만큼 이동해서 현재 인덱스는 \(currentIdx)이다")
        }
        
        
        else if cmd[i].contains("C") {
            
            let node = linkedList.node(at: currentIdx - 1)
            var removedValue: Int = linkedList.remove(after: node!)!
            print("제거된 값은 \(removedValue) 이다")
            
            if removedValue > linkedList.size() {
                
            }
            
            stack.append(removedValue)
            
            if currentIdx == linkedList.size() - 1 {
                currentIdx = 1
            }
            
            
            /*
            if currentIdx == linkedList.size()-1 {
                print("리스트 현재 크기 \(linkedList.size())")
                currentIdx = 1
            }
            else {
                print("삭제후 인덱스 증가")
                currentIdx += 1
                print("증가된 인덱스 : \(currentIdx)")
            }
             */
        }
        
        else {
            print("되돌리기 돌입")
            var insertValue = stack.last!
            linkedList.insert(insertValue, after: linkedList.node(at: insertValue)!)
            
            // 스택에 삽입은 Ok
            // 근데 링크드리스트에서 제거한 값의 주소와 제거한 후의 주소가
            // 일치하지 않아서 에러가발생
            // 이거해결해야함
        }
        
        print("리스트 길이는 \(linkedList.size())")
        print(stack)
    }
    
    print(stack)
    
    /*
    while !stack.isEmpty {
        var idx = 0
        if idx == stack.last {
            answer += "X"
            answer.removeLast()
        }
        else {
            answer += "O"
        }
        idx += 1
    }
 
 */
    
    print(answer)
    
    return ""
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))


// prev = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8]
// next = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


/*
 
 D 2: k = next[2] = 3
 C : deleted.append(3)
 next[prev[3]] = next[2] <- next[3] =
 -> next[2] = 4
 prev[next[3]] = prev[4] <- prev[3] =
 -> prev[4] = 2
 
 if next[3] == 9 {
    
 }
 */
