//
//  main.swift
//  백준 ACM Craft
//
//  Created by 강민성 on 2022/05/23.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

func topologicalSort(_ N: Int, _ edges: [[Int]], _ indegree: [Int], _ result: [Int], _ D: [Int], _ finish: Int) -> Int {
    
    var queue = [Int]()
    var result = result
    var indegree = indegree
    
    for i in 1...N {
        if indegree[i] == 0 {
            queue.append(i)
            result[i] = D[i]
        }
    }
    
    var index = 0
    
    while index < queue.count {
        
        var node = queue[index]
        
        if node == finish {
            break
        }
        
        for next in edges[node] {
            indegree[next] -= 1
            result[next] = max(result[next], result[node] + D[next])
            
            if indegree[next] == 0 {
                queue.append(next)
            }
        }
        index += 1
    }
    return result[finish]
}

var fileio = FileIO()

var T = fileio.readInt()

for i in 0..<T {
    var N = fileio.readInt()
    var K = fileio.readInt()
    
    var indegree = [Int](repeating: 0, count: N + 1)
    var result = [Int](repeating: 0, count: N + 1)
    var edges = [[Int]](repeating: [Int](repeating: 0, count: 0), count: N + 1)
    
    var D = [Int](repeating: 0, count: 1)
    
    for i in 0..<N {
        D.append(fileio.readInt())
    }
    
    for i in 0..<K {
        var start = fileio.readInt()
        var end = fileio.readInt()
        
        edges[start].append(end)
        indegree[end] += 1
        
    }
    
    var finish = fileio.readInt()
    
    print(topologicalSort(N, edges, indegree, result, D, finish))
    
}


/*
 
 7 = 1
 6 = 7
 5 = 8
 2 = 20
 3 = 1
 1 = 10
 */
