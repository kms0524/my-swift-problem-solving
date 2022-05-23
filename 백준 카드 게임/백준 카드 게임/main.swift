//
//  main.swift
//  백준 카드 게임
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


func upper_bound(_ arr: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
    
    var start = start
    var end = end
    
    while start < end {
        var mid = (start + end) / 2
        
        if arr[mid] <= target {
            start = mid + 1
        }
        else {
            end = mid
        }
    }
    
    return end
}

//t로 초기화하기
//for i in 1...N  {
//    parent[i] = i
//}

func find(_ value: Int) -> Int {
    if parent[value] == value {
        return value
    }
    
    parent[value] = find(parent[value])
    return parent[value]
}

func union(_ a: Int, _ b: Int) {

    if b >= M {
        return
    }

    let aRoot = find(a)
    let bRoot = find(b)
    parent[aRoot] = bRoot
}


var fileio = FileIO()

var N = fileio.readInt()
var M = fileio.readInt()
var K = fileio.readInt()

var cardNum = [Int]()

for i in 0..<M {
    cardNum.append(fileio.readInt())
}

cardNum.sort()

var parent = [Int](0..<M)

var arr = [Int]()

for i in 0..<K {
    arr.append(fileio.readInt())
}

for num in arr {
    var idx = upper_bound(cardNum, 0, M, num)
    idx = find(idx)
    print(cardNum[idx])
    union(idx, idx+1)
}
