//
//  main.swift
//  백준 최소비용 구하기
//
//  Created by 강민성 on 2021/08/03.
//

import Foundation

public struct PriorityQueue<T> {
    
    var node: [T] = []
    var comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return node.isEmpty
    }
    
    init(comparer: @escaping (T, T) -> Bool) {
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
    
    let node: Int
    let cost: Int
}

let N: Int = Int(readLine()!)!
let M: Int = Int(readLine()!)!

var map = Array(repeating: [(Int, Int)](), count: N)

for _ in 0..<M {
    let bus = readLine()!.split(separator: " ").map { Int($0)! }
    map[bus[0] - 1].append((bus[1] - 1, bus[2]))
}

var INF: Int = Int.max

var dist = Array(repeating: INF, count: N)

let startEnd = readLine()!.split(separator: " ").map{ Int($0)! }

let start = startEnd[0] - 1
let end = startEnd[1] - 1

dist[start] = 0

var pq: PriorityQueue = PriorityQueue<Node>()

pq.insert(Node(node: start, cost: 0))

while !pq.isEmpty {
    let now = pq.delete()!
    
    if dist[now.node] < now.cost {
        continue
    }
    
    for next in map[now.node] {
        if now.cost + next.1 < dist[next.0] {
            dist[next.0] = now.cost + next.1
            pq.insert(Node(node: next.0, cost: now.cost + next.1))
        }
    }
    
}

print(dist[end])
