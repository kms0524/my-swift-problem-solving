//
//  main.swift
//  백준 최단경로
//
//  Created by 강민성 on 2021/08/03.
//

import Foundation

public struct PriorityQueue<T> {
    
    var nodes: [T] = []
    var comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ element: T) {
        
        var index = nodes.count
        
        nodes.append(element)
        
        while index > 0, !comparer(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    
    
    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                }
                else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            }
            else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
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

let firstInput = readLine()!.split(separator: " ").map{ Int($0)! }
let v = firstInput[0]
let e = firstInput[1]

let start = Int(readLine()!)! - 1

var map = Array(repeating: [(Int, Int)](), count: v)

for _ in 0..<e {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    map[line[0] - 1].append((line[1] - 1, line[2]))
}

let INF = 600000

var dist = Array(repeating: INF, count: v)

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

print(dist)

for i in dist {
    if i == INF {
        print("INF")
    }
    else {
        print(i)
    }
}

