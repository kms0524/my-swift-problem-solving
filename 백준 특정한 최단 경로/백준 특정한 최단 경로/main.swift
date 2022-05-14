//
//  main.swift
//  백준 특정한 최단 경로
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
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return node.first
    }
    
    mutating func insert(_ element: T) {
        var index = node.count
        node.append(element)
        
        while index > 0, !comparer(node[index], node[(index - 1)]) {
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


var NE = readLine()!.split(separator: " ").map{ Int($0)! }

var N = NE[0]
var E = NE[1]

var INF = Int.max

var check = false

var map = Array(repeating: [(Int, Int)](), count: N)
var dist = Array(repeating: INF, count: N)

for _ in 0..<E {
    let line = readLine()!.split(separator: " ").map{ Int($0)! }
    map[line[0] - 1].append((line[1] - 1, line[2]))
    map[line[1] - 1].append((line[0] - 1, line[2]))
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }

var v1 = input[0] - 1
var v2 = input[1] - 1






func dijkstra(dist: [Int], map: [[(Int, Int)]], start: Int, end: Int) -> (Bool, Int) {
    var pq: PriorityQueue = PriorityQueue<Node>()
    let map = map
    var dist = dist
    dist[start] = 0
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
    
    
    if dist[end] == INF {
        check = true
        return (check, dist[end])
    }
    else {
        return (check, dist[end])
    }
}

var zeroToV1Dist = dijkstra(dist: dist, map: map, start: 0, end: v1).1
var zeroToV1Check = dijkstra(dist: dist, map: map, start: 0, end: v1).0

//print(zeroToV1Dist)
var zeroToV2Dist = dijkstra(dist: dist, map: map, start: 0, end: v2).1
var zeroToV2Check = dijkstra(dist: dist, map: map, start: 0, end: v2).0
//print(zeroToV2Dist)
var v1ToV2Dist = dijkstra(dist: dist, map: map, start: v1, end: v2).1
var v1ToV2Check = dijkstra(dist: dist, map: map, start: v1, end: v2).0
//print(v1ToV2Dist)
var v2ToEndDist = dijkstra(dist: dist, map: map, start: v2, end: N - 1).1
var v2ToEndCheck = dijkstra(dist: dist, map: map, start: v2, end: N - 1).0
//print(v2ToEndDist)
var v1ToEndDist = dijkstra(dist: dist, map: map, start: v1, end: N - 1).1
var v1ToEndCheck = dijkstra(dist: dist, map: map, start: v1, end: N - 1).0
//print(v1ToEndDist)

var minDist: Int

if zeroToV1Check == true || zeroToV2Check == true || v1ToV2Check == true || v1ToEndCheck == true || v2ToEndCheck == true {
    minDist = -1
}
else {
    minDist = min((zeroToV1Dist + v1ToV2Dist + v2ToEndDist), zeroToV2Dist + v1ToV2Dist + v1ToEndDist)
}

print(minDist)

print(dist)
