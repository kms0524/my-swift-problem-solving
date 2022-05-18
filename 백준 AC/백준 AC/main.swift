//
//  main.swift
//  백준 AC
//
//  Created by 강민성 on 2022/05/16.
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

public struct Deque<T> {
    private var array: [T?]
    private var head: Int
    private var capacity: Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
}


var fileio = FileIO()

var T = fileio.readInt()

for i in 0..<T {
    
    var flag = false
    
    var oper = fileio.readString().map { $0 }
    var size = fileio.readInt()
    var input = fileio.readString()
    
    input = input.replacingOccurrences(of: ",", with: " ")
    input.removeFirst()
    input.removeLast()
    
    var arr = [Int]()
    var deque = Deque<Int>()
    var rCount = 0
    
    if input.count == 0 {
        arr = []
    }
    else {
        arr = input.split(separator: " ").map { Int($0)! }
        for i in 0..<arr.count {
            deque.enqueue(arr[i])
        }
    }
    
    for i in 0..<oper.count {
        if oper[i] == "D" {
            if deque.count == 0 {
                flag = true
            }
            else {
                if rCount % 2 == 0 {
                    deque.dequeue()!
                }
                else {
                    deque.dequeueBack()!
                }
            }
        }
        else {
            rCount += 1
        }
    }
    
    if flag == false {
        var answer = "["
        for i in 0..<deque.count {
            if rCount % 2 == 0 {
                answer += "\(deque.dequeue()!)"
            }
            else {
                answer += "\(deque.dequeueBack()!)"
            }
            answer += ","
        }
        if answer == "[" {
            answer += "]"
        }
        else {
            answer.removeLast()
            answer += "]"
        }
        print(answer)
    }
    else {
        print("error")
    }
}

