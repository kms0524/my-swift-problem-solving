//
//  main.swift
//  백준 파티
//
//  Created by 강민성 on 2021/08/04.
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
            return node.removeLast()
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
                
                if comparer(node[left], node[index]) {
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

var firstInput = readLine()!.split(separator: " ").map{ Int($0)! }

var N = firstInput[0]
var M = firstInput[1]
var X = firstInput[2]

var map = Array(repeating: [(Int, Int)](), count: M)
var sumArray = [Int](repeating: 0, count: N)

var INF: Int = Int.max


for _ in 0..<M{
    
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    map[line[0] - 1].append((line[1] - 1, line[2]))
}

for studentNum in 0..<N {
    
    var goingPQ: PriorityQueue = PriorityQueue<Node>()
    var comingPQ: PriorityQueue = PriorityQueue<Node>()
    
    var dist = Array(repeating: INF, count: N)
    
    goingPQ.insert(Node(node: studentNum, cost: 0))
    
    while !goingPQ.isEmpty {
        let now = goingPQ.delete()!
        
        if dist[now.node] < now.cost {
            continue
        }
        
        for next in map[now.node] {
            if now.cost + next.1 < dist[next.0] {
                dist[next.0] = now.cost + next.1
                goingPQ.insert(Node(node: next.0, cost: now.cost + next.1))
            }
        }
    }
    
    sumArray[studentNum] += dist[X]
    
    dist = Array(repeating: INF, count: N)
    
    comingPQ.insert(Node(node: X, cost: 0))
    
    while !comingPQ.isEmpty {
        let now = comingPQ.delete()!
        
        if dist[now.node] < now.cost {
            continue
        }
        
        for next in map[now.node] {
            if now.cost + next.1 < dist[next.0] {
                dist[next.0] = now.cost + next.1
                comingPQ.insert(Node(node: next.0, cost: now.cost + next.1))
            }
        }
    }
    
    sumArray[studentNum] += dist[studentNum]
    
}

print(sumArray.max()!)

