//
//  main.swift
//  프로그래머스 미로 탈출_2
//
//  Created by 강민성 on 2021/08/03.
//

import Foundation


public struct PriorityQueue<T> {
    
    var nodes: [T] = []
    let comparer: (T, T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func enqueue(_ element: T) {
        var index: Int = nodes.count
        
        nodes.append(element)
        
        while index > 0, !comparer(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    mutating func dequeue() -> T? {
        
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let result: T? = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left: Int = index * 2 + 1
            let right: Int = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                   !comparer(nodes[right], nodes[index]) {
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
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                }
                else {
                    break
                }
            } else {
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
    let trapState: Int
}

func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    
    var map: [[(v: Int, cost: Int)]] = Array(repeating: [], count: n + 1)
    var reversedMap: [[(v: Int, cost: Int)]] = Array(repeating: [], count: n + 1)
    
    var trapIndexDic: [Int: Int] = [:]
    var pq: PriorityQueue<Node> = .init()
    var dist: [[Int]] = Array(repeating: Array(repeating: Int.max, count: 1 << traps.count), count: n + 1)
    
    for i in roads {
        map[i[0]].append((v: i[1], cost: i[2]))
        reversedMap[i[1]].append((v: i[0], cost: i[2]))
    }
    
    for i in 0..<n {
        trapIndexDic[i] = -1
        
    }
    
    var trapIndex: Int = 0
    for i in traps {
        trapIndexDic[i] = trapIndex
        trapIndex += 1
    }
    
    pq.enqueue(Node(node: start, cost: 0, trapState: 0))
    dist[start][0] = 0
    
    while !pq.isEmpty {
        guard let now = pq.dequeue() else {
            return Int.max
        }
        
        if now.node == end {
            return dist[end][now.trapState]
        }
        
        if dist[now.node][now.trapState] < now.cost {
            continue
        }
        
        let trapIndex = trapIndexDic[now.node]!
        
        if trapIndex == -1 || now.trapState & (1 << trapIndex) == 0 {
            for next in map[now.node] {
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex == -1 {
                    if now.cost + next.cost < dist[next.v][now.trapState] {
                        dist[next.v][now.trapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: now.trapState))
                    }
                    else {
                        if now.trapState & (1 << nextNodeTrapIndex) == 0 {
                            
                            let nextTrapState = now.trapState | (1 << nextNodeTrapIndex)
                            if now.cost + next.cost < dist[next.v][nextTrapState] {
                                dist[next.v][nextTrapState] = now.cost + next.cost
                                pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                            }
                        }
                        
                    }
                }
            }
            
            for next in reversedMap[now.node] {
                let nextNodeTrapState = trapIndexDic[next.v]!
                if nextNodeTrapState != -1 && (now.trapState & (1 << nextNodeTrapState) > 0) {
                    
                    let nextTrapState = now.trapState & ~(1 << nextNodeTrapState)
                    if now.cost + next.cost < dist[next.v][nextTrapState] {
                        dist[next.v][nextTrapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                    }
                }
            }
        }
        else {
            for next in map[now.node] {
                
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                
                if nextNodeTrapIndex != -1 {
                    if now.trapState & (1 << nextNodeTrapIndex) > 0 {
                        
                        let nextTrapState = now.trapState & ~(1 << nextNodeTrapIndex)
                        if now.cost + next.cost < dist[next.v][nextTrapState] {
                            dist[next.v][nextTrapState] = now.cost + next.cost
                            pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                        }
                    }
                }
            }
            
            for next in reversedMap[now.node] {
                
                let nextNodeTrapIndex = trapIndexDic[next.v]!
                if nextNodeTrapIndex == -1 {
                    
                    if now.cost + next.cost < dist[next.v][now.trapState] {
                        dist[next.v][now.trapState] = now.cost + next.cost
                        pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: now.trapState))
                    }
                }
                
                else {
                    if now.trapState & (1 << nextNodeTrapIndex) == 0 {
                        let nextTrapState = now.trapState | (1 << nextNodeTrapIndex)
                        if now.cost + next.cost < dist[next.v][nextTrapState] {
                            dist[next.v][nextTrapState] = now.cost + next.cost
                            pq.enqueue(Node(node: next.v, cost: now.cost + next.cost, trapState: nextTrapState))
                        }
                    }
                }
                
            }
        }
        
    }
    
    
    return Int.max
}
