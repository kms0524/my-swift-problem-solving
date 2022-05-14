//
//  main.swift
//  프로그래머스 표 편집_2
//
//  Created by 강민성 on 2021/07/28.
//

import Foundation


/*

final class Node {
    
    var value: String
    weak var prev: Node?
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}



final class DoubleLinkedList {
    
    private var head : Node?
    private weak var tail : Node?
    
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count : Int {
        
        guard var node = head else {
            return 0
        }
        
        var count = 1
        
        while let nextNode = node.next {
            count += 1
            node = nextNode
        }
        
        return count
        
    }
    
    func append(node: Node) {
        
        if let tailNode = tail {
            tailNode.next = node
            node.prev = tailNode
        }
        else {
            head = node
        }
        tail = node
    }
    
    func insert(node newNode: Node, at index: Int) {
        
        var node = head
        
        for _ in 0..<index {
            node = node?.next
            
        }
        
        guard node != nil else {
            return print("양방향 링크드 리스트 인덱스 에러")
        }
        
        newNode.prev = node?.prev
        newNode.next = node
        node?.prev?.next = newNode
        node?.prev = newNode
    }
    
    func node(at index: Int) -> Node? {
        
        var node = head
        
        for _ in 0..<index {
            node = node?.next
        }
        
        return node
    }
    
    func node(by value: String) -> Node? {
        
        var node = head
        
        while node?.value != value {
            node = node?.next
        }
        
        return node
    }
    
    func remove(at index: Int) -> String? {
        
        guard let node = node(at: index) else {
            return nil
        }
        
        if node === head {
            
            head = node.next
        }
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        return node.value
    }
    
    func remove(by value: String) -> Bool {
        guard let node = node(by: value) else {
            return false
        }
        
        if node === head {
            head = node.next
        }
        else if node === tail {
            tail = node.prev
        }
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        return true
    }
    
    func restore(by value: Node) {
        
        guard let node = node(by: value.value) else {
            return
        }
        
        if node.prev == nil {
            head = node
            node.next?.prev = node
        }
        
        else if node.next == nil {
            tail = node
            node.prev?.next = node
        }
        else {
            node.prev?.next = node
            node.next?.prev = node
        }
    }
    
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func searchValue() {
        var values: [String] = []
        var node = head
        
        while let _ = node {
            values.append(node!.value)
            node = node!.next
        }
        
        print("value:", values)
    }
    
    
}


func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    
    // ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
    
    let dll = DoubleLinkedList()
    
    
    var stack: [String] = []
    var currentIdx = k
    
    for i in 0..<n {
        dll.append(node: Node(value: String(i)))
    }

    print(dll.searchValue())
    
    for i in 0..<n {
        if cmd[i].contains("U") {
            var split = cmd[i].split(separator: " ").map { String($0) }
            var moveCount: Int = Int(split[1])!
            
            currentIdx -= moveCount
//            print("\(i+1)번째 커맨드로, 위로 이동한후 리스트 \(dll.searchValue())")
        }
        else if cmd[i].contains("D") {
            var split = cmd[i].split(separator: " ").map { String($0) }
            var moveCount: Int = Int(split[1])!
            
            currentIdx += moveCount
            
            print("\(i+1)번째 커맨드로, 아래로 이동한후 리스트 \(dll.searchValue())")
        }
        else if cmd[i].contains("C") {
            print("삭제돌입")
            let target: String = dll.node(at: currentIdx)!.value
            print("타겟: \(target)")
            dll.remove(at: currentIdx)
            stack.append(target)
            print("스택: \(stack)")
            print("\(i+1)번째 커맨드로, 삭제후 리스트 \(dll.searchValue())")
        }
        else {
            print("복구 돌입")
            var target = stack.last!
            var targetNode = Node.init(value: target)
            print("복구할 스택: \(target)")
            dll.restore(by: targetNode)
            print("\(i+1)번째 커맨드로, 복구후 리스트 \(dll.searchValue())")
        }
    }
    
    // ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
    
//    print(dll.searchValue())
    
    return ""
}

solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"])


*/

class Node {
    var value: Int
    var previous: Node?
    var next: Node?

    init(value: Int) {
        self.value = value
    }
}
class LinkedList {
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
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }

    func remove(node: Node) -> Node{
        let pre = node.previous
        let next = node.next

        if let pre = pre {
            pre.next = next
        } else {
            head = next
        }

        if let next = next {
            next.previous = pre
            return next
        } else {
            tail = pre
            return tail!
        }
    }

    func reInsert(node: Node) {
        let pre = node.previous
        let next = node.next

        if let pre = pre {
            pre.next = node
        } else {
            head?.previous = node
            head = node
        }

        if let next = next {
            next.previous = node
        } else {
            tail?.next = node
            tail = node
        }
    }

}



func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    let linkedList = LinkedList()
    var currentNode: Node?
    var removedNode = [Node?]()
    for i in 0..<n {
        linkedList.insert(value: i)
        if i == k { currentNode = linkedList.tail! }
    }

    for c in cmd {
        let input = c.split(separator: " ").map{String($0)}
        let command = input[0]

        switch command {
        case "D":
            var move = Int(input[1])!
            while move != 0 {
                move -= 1
                currentNode = currentNode?.next
            }
            currentNode = currentNode == nil ? linkedList.tail : currentNode
        case "U":
            var move = Int(input[1])!
            while move != 0 {
                move -= 1
                currentNode = currentNode?.previous
            }
            currentNode = currentNode == nil ? linkedList.head : currentNode
        case "C":
            removedNode.append(currentNode)
            currentNode = linkedList.remove(node: currentNode!)
        case "Z":
            linkedList.reInsert(node: removedNode.removeLast()!)
        default:
            continue
        }
    }

    var st = linkedList.head
    var ans = Array(repeating: "X", count: n)

    while st != nil {
        let v = st!.value
        ans[v] = "O"
        st = st?.next
    }

    return ans.joined()
}
