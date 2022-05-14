//
//  main.swift
//  백준 녹색 옷 입은 애가 젤다지?
//
//  Created by 강민성 on 2021/08/07.
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
            let right = index + 1
            
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
    
    var nodeX: Int
    var nodeY: Int
    var cost: Int
}


while true {
    
    var N = Int(readLine()!)!
    
    if N == 0 {
        break
    }
    
    var dx = [1, -1, 0, 0]
    var dy = [0, 0, 1, -1]
    
    var INF = Int.max
    
    
    var map = [[Int]](repeating: [Int](), count: N)
    var dist = [[Int]](repeating: [Int](repeating: INF, count: N), count: N)
    
    
    for i in 0..<N {

        map[i] = Array(readLine()!.split(separator: " ").map{ Int($0)! })
    }
    
    
    dist[0][0] = map[0][0]
    print(dist.count)
    print(map.count)
    
    var pq: PriorityQueue = PriorityQueue<Node>()

    pq.insert(Node(nodeX: 0, nodeY: 0, cost: map[0][0]))
    
    while !pq.isEmpty {
        let now = pq.delete()!
        
        
        
        for i in 0..<4 {
            var xx = now.nodeX + dx[i]
            var yy = now.nodeY + dy[i]
            
            if xx >= 0 && xx < N && yy >= 0 && yy < N {
                if dist[xx][yy] > (dist[now.nodeX][now.nodeY] + map[xx][yy]) {
                    dist[xx][yy] = dist[now.nodeX][now.nodeY] + map[xx][yy]
                    pq.insert(Node(nodeX: xx, nodeY: yy, cost: dist[xx][yy]))
                }
            }
        }
    }
    
    print(dist[N - 1][N - 1])
    
}
