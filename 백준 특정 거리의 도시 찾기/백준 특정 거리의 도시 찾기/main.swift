//
//  main.swift
//  백준 특정 거리의 도시 찾기
//
//  Created by 강민성 on 2021/08/12.
//

/*


import Foundation

final class FileIO {
    
    private var buffer:[UInt8]
    private var index: Int
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        return sum * (isPositive ? 1:-1)
    }
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        return str
    }
}



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
    
    mutating func insert(element: T) {
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
    
    var node: Int
    var cost: Int
    
}

let file = FileIO()

let N = file.readInt(), M = file.readInt(), K = file.readInt(), X = file.readInt() - 1

var INF = 300000

var map = Array(repeating: [(Int, Int)](), count: N)
var dist = Array(repeating: INF, count: N)

var answer: [Int] = []

for _ in 0..<M {
    let start = file.readInt()
    let end = file.readInt()
    map[start - 1].append((end - 1, 1))
}

dist[X] = 0

var pq: PriorityQueue = PriorityQueue<Node>()

pq.insert(element: Node(node: X, cost: 0))

while !pq.isEmpty {
    
    let now = pq.delete()!
    
    if dist[now.node] < now.cost {
        continue
    }
    
    for next in map[now.node] {
        
        if now.cost + 1 < dist[next.0] {
            
            dist[next.0] = now.cost + 1
            pq.insert(element: Node(node: next.0, cost: now.cost + 1))
            
        }
    }
}

for i in 0..<dist.count {
    
    if dist[i] == K {
        answer.append(i + 1)
    }
}

if answer.isEmpty {
    print(-1)
}
else {
    answer.forEach {
        print($0)
    }
}

 */

import Foundation
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}





let file = FileIO()
import Foundation



let N = file.readInt(), M = file.readInt(), K = file.readInt(), X = file.readInt()


var array = Array(repeating: [Int](), count: N+1)
for _ in 0..<M {
    let x = file.readInt()
    let y = file.readInt()
    array[x].append(y)
}

var queue = [(X,0)]
var visit = Array(repeating: false, count: N+1)
var cost = Array(repeating: 0, count: N+1)
visit[X] = true

var kList = [Int]()
while !queue.isEmpty {
    let first = queue.removeFirst()
    if first.1 >= K { continue }
    for next in array[first.0] {
        if visit[next] == false {
            visit[next] = true
            cost[next] = first.1 + 1
            queue.append((next,first.1+1))
            if first.1 + 1 == K { kList.append(next)}
        }
    }
}

kList.sort()
if kList.count == 0 { print(-1)}
else {
    kList.forEach{print($0)}
}

