//
//  main.swift
//  백준 최소비용 구하기 2
//
//  Created by 강민성 on 2021/08/09.
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
    
    var node: Int
    var cost: Int
    
}

var n = Int(readLine()!)!
var m = Int(readLine()!)!

var pq: PriorityQueue = PriorityQueue<Node>()

var map: [[Int]] = Array(repeating: Array(repeating: 100001, count: n + 1), count: n + 1)

for _ in 1...m {
    
    let bus = readLine()!.split(separator: " ").map{ Int(String($0))! }
    map[bus[0]][bus[1]] = min(map[bus[0]][bus[1]], bus[2])
}

let se = readLine()!.split(separator: " ").map{ Int(String($0))! }

let start = se[0]
let end = se[1]

var INF = Int.max


var dist: [Int] = Array(repeating: INF, count: n + 1)
var route: [Int] = Array(repeating: -1, count: n + 1)

pq.insert(Node(node: start, cost: 0))
dist[start] = 0

while !pq.isEmpty {
    
    let current = pq.delete()!
    
    for i in 1...n {
        
        let cost = current.cost + map[current.node][i]
        
        if map[current.node][i] != 100001 && dist [i] > cost {
            dist[i] = cost
            route[i] = current.node
            pq.insert(Node(node: i, cost: cost))
        }
    }
}


//print(route)

var check = end
var answer: [String] = ["\(end)"]

print(dist[end])

while check != start {
    
    answer.append("\(route[check])")
    check = route[check]
}

print(answer.count)
print(answer.reversed().joined(separator: " "))
