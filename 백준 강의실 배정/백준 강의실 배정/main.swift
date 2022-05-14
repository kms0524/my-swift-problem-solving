//
//  main.swift
//  백준 강의실 배정
//
//  Created by 강민성 on 2022/05/11.
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

public struct PriorityQueue<T> {
    
    private var heap: [T] = []
    public let comparing: (_ o1: T,_ o2: T) -> Bool
    
    public init(comparing: @escaping (_ o1: T,_ o2: T) -> Bool) {
        self.comparing = comparing
    }
    
    func size() -> Int {
        heap.count
    }
    
    func isEmpty() -> Bool {
        heap.isEmpty
    }
    
    mutating func clear() {
        heap.removeAll()
    }
    
    func peek() -> T? {
        heap.first
    }
    
    mutating func push(_ value: T) {
        heap.append(value)
        
        if heap.count == 1 {
            return
        }
        
        var valueIndex = heap.count - 1
        var parentIndex = (valueIndex-1) / 2
        
        while !comparing(heap[parentIndex], heap[valueIndex]) {
            
            heap.swapAt(valueIndex, parentIndex)
            valueIndex = parentIndex
            parentIndex = (valueIndex-1) / 2
            
            if valueIndex == 0 {
                break
            }
        }
    }
    
    mutating func pop() -> T? {
        if heap.count == 0 {
            return nil
        }
        
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        func isChildEmpty(_ value: Int,_ left: Int,_ right: Int) -> Bool {
            if heap.count <= left {
                return true
            }
            
            if heap.count > right {
                return false
            }
            
            if comparing(heap[value], heap[left]) {
                return true
            }
            
            heap.swapAt(value, left)
            return true
        }
        
        heap.swapAt(0, heap.count-1)
        
        let answer = heap.removeLast()
        
        var valueIndex = 0
        var leftIndex = valueIndex * 2 + 1
        var rightIndex = valueIndex * 2 + 2
        
        if isChildEmpty(valueIndex, leftIndex, rightIndex) {
            return answer
        }
        
        while !comparing(heap[valueIndex], heap[leftIndex]) || !comparing(heap[valueIndex], heap[rightIndex]) {
            
            let index = comparing(heap[leftIndex], heap[rightIndex]) ? leftIndex : rightIndex
            
            heap.swapAt(valueIndex, index)
            valueIndex = index
            leftIndex = valueIndex * 2 + 1
            rightIndex = valueIndex * 2 + 2
            
            if isChildEmpty(valueIndex, leftIndex, rightIndex) {
                break
            }
        }
        return answer
    }
}


var fileIo = FileIO()

var N = fileIo.readInt()

var arr = [(Int, Int)]()
var pq = PriorityQueue<(s: Int, t: Int)> { o1, o2 in
    o1.t - o1.s < o2.t - o1.s
}

for i in 0..<N {
    arr.append((fileIo.readInt(), fileIo.readInt()))
}

arr.sort { $0.0 < $1.0 }

pq.push(arr[0])

for i in 1..<arr.count {
    var current = arr[i]
    
    if current.0 >= pq.peek()!.t {
        pq.pop()
    }
    pq.push(current)
}

print(pq.size())
