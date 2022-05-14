//
//  main.swift
//  백준 최소비용 구하기 2_2
//
//  Created by 강민성 on 2021/08/10.
//

import Foundation

struct PriorityQueue {
    var queue = Queue<(Int, Int)>(compare: {$0.1 < $1.1})
    var count:Int {
        return queue.count
    }
    var isEmpty:Bool {
        return queue.isEmpty
    }
    mutating func insert(_ a: (Int, Int)) {
        queue.insert(a)
    }
    mutating func remove() -> (Int, Int)? {
        return queue.pop()
    }
}

struct Queue<T> {
    var arr:[T]
    var compare:(T, T) -> Bool
    var count:Int {
        return arr.count
    }
    var isEmpty:Bool {
        return arr.isEmpty
    }
    init(arr: [T] = [], compare: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.compare = compare
    }
    mutating func shiftUp(_ a: Int) {
        var i = a
        while i > 0 {
            let parent = (i-1)/2
            if compare(arr[i], arr[parent]) {
                arr.swapAt(i, parent)
                i = parent
            }
            else {
                break
            }
        }
    }
    mutating func shiftDown(_ a: Int) {
        var i = a
        var child = 2*i+1
        while child < arr.count {
            if child+1 < arr.count && compare(arr[child+1], arr[child]) {
                child += 1
            }
            if compare(arr[child], arr[i]) {
                arr.swapAt(child, i)
                i = child
                child = 2*i+1
            }
            else {
                break
            }
        }
    }
    mutating func insert(_ a: T) {
        arr.append(a)
        shiftUp(arr.count-1)
    }
    mutating func pop() -> T? {
        if arr.isEmpty {
            return nil
        }
        else {
            arr.swapAt(0, arr.count-1)
            let result = arr.popLast()
            shiftDown(0)
            return result
        }
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph:[[Int]] = Array(repeating: Array(repeating: 100001, count: n+1), count: n+1)
for _ in 1...m {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[line[0]][line[1]] = min(graph[line[0]][line[1]], line[2])
}
let se = readLine()!.split(separator: " ").map{Int(String($0))!}
let start = se[0], end = se[1]
var Dist:[Int] = Array(repeating: 1_000_000_000, count: n+1)
var trace:[Int] = Array(repeating: -1, count: n+1)
var pq = PriorityQueue()

print(Dist)
print(trace)
print(graph)


pq.insert((start, 0))
Dist[start] = 0
while !pq.isEmpty {
    let current = pq.remove()!
    for i in 1...n {
        let cost = current.1 + graph[current.0][i]
        if graph[current.0][i] != 100001 && Dist[i] > cost {
            Dist[i] = cost
            trace[i] = current.0
            pq.insert((i, cost))
        }
    }
}

print(trace)

//print(Dist[end])
var a = end
var result:[String] = ["\(a)"]
while a != start {
    result.append("\(trace[a])")
    a = trace[a]
}
//print(result.count)
//print(result.reversed().joined(separator: " "))
