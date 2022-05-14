//
//  main.swift
//  백준 숨바꼭질 3
//
//  Created by 강민성 on 2021/08/05.
//

import Foundation

public struct PriorityQueue<T> {
    
    var node: [T] = []
    var comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return node.isEmpty
    }
    
    init(comparer: @escaping(T, T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return node.first
    }
    
    mutating func insert(_ element: T) {
        var index = node.count
        
        node.append(element)
        
        while index > 0, !comparer(node[index], node[(index - 1) / 2]) {
            node.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    mutating func delete() -> T? {
        
        guard !node.isEmpty else {
            return nil
        }
        
        if node.count == 1 {
            return node.removeFirst()
        }
        
        let result = node.first
        node.swapAt(0, node.count - 1)
        _ = node.popLast()
        
        var index = 0
        
        while index < node.count {
            let left = index * 2 + 1
            let right = left + 1
            
            if right < node.count {
                
                if comparer(node[left], node[right]), !comparer(node[right], node[index]) {
                    node.swapAt(right, index)
                    index = right
                }
                
                else if !comparer(node[left], node[index]) {
                    node.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else if left < node.count {
                
                if !comparer(node[left], node[index]) {
                    node.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
        return result
    }
}

extension PriorityQueue where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }
    
    var node: Int
    var cost: Int
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }

var start = input[0]
var end = input[1]

var INF = Int(1e9)

var pq: PriorityQueue = PriorityQueue<Node>()

var dist = Array(repeating: INF, count: 100001)

dist[start] = 0
pq.insert(Node(node: start, cost: 0))

while !pq.isEmpty {
    
    let now = pq.delete()!
    
    if now.node == end {
        break
    }
    
    if dist[now.node] < now.cost {
        continue
    }
    
    // 순간이동
    if now.node * 2 < 100001, now.cost < dist[2 * (now.node)] {
        dist[2 * now.node] = now.cost
        pq.insert(Node(node: 2 * now.node, cost: now.cost))
    }
    
    // 1만큼 앞으로
    if now.node + 1 < 100001, now.cost + 1 < dist[now.node + 1] {
        dist[now.node + 1] = now.cost + 1
        pq.insert(Node(node: now.node + 1, cost: now.cost + 1))
    }
    
    // 1만큼 뒤로
    if now.node - 1 >= 0, now.cost + 1 < dist[now.node - 1] {
        dist[now.node - 1] = now.cost + 1
        pq.insert(Node(node: now.node - 1, cost: now.cost + 1))
    }
    
}

print(dist[end])
