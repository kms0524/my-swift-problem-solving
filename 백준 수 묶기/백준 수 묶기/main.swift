//
//  main.swift
//  백준 수 묶기
//
//  Created by 강민성 on 2022/05/10.
//

import Foundation

struct PriorityQueue<T> {
    
    private var heap: [T] = []
    private let comparing: (_ o1: T,_ o2: T) -> Bool
    
    init(_ comparing: @escaping (_ o1: T,_ o2: T) -> Bool) {
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


var N = Int(readLine()!)!

var pq = PriorityQueue<Int>(<)
var sum = 0

for i in 0..<N {
    pq.push(Int(readLine()!)!)
}

var arr1 = [Int]()
var arr2 = [Int]()

for i in 0..<pq.size() {
    var current = pq.pop()!
    
    if current <= 0 {
        arr1.append(current)
    }
    else {
        arr2.append(current)
    }
}

var lastNum = 0

if arr1.count % 2 == 1 {
    lastNum = arr1.removeLast()
    sum += lastNum
}

for i in 0..<(arr1.count / 2) {
    var idx = 0
    sum += arr1[idx] * arr1[idx + 1]
    arr1.removeFirst()
    arr1.removeFirst()
}

while arr2.count > 0 {
    var current = arr2.first!
    if current > 1 {
        break
    }
    else {
        sum += 1
        arr2.removeFirst()
    }
}

if arr2.count % 2 == 1 {
    sum += arr2.first!
    arr2.removeFirst()
}

var reversed = Array(arr2.reversed())

for i in 0..<(reversed.count / 2) {
    var idx = 0
    sum += reversed[idx] * reversed[idx + 1]
    reversed.removeFirst()
    reversed.removeFirst()
}

print(sum)

/*
 
 0이면 곱
 0이상이면 더하기
 
 -1 1 2 3
 
 */
