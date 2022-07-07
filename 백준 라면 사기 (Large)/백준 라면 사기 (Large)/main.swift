//
//  main.swift
//  백준 라면 사기 (Large)
//
//  Created by 강민성 on 2022/07/05.
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

var fileio = FileIO()

var N = fileio.readInt()
var B = fileio.readInt()
var C = fileio.readInt()

var arr = [Int](repeating: 0, count: 1000002)

for i in 0..<N {
    arr[i] = fileio.readInt()
}

var answer = 0

if B < C {
    for i in 0..<N {
        answer += B * arr[i]
    }
}

else {
    for i in 0..<N {
        
        if arr[i + 1] > arr[i + 2] {
            var buyTwo = min(arr[i], arr[i + 1] - arr[i + 2])
            answer += (B + C) * buyTwo
            arr[i] -= buyTwo
            arr[i + 1] -= buyTwo
            
            var buyThree = min(arr[i], min(arr[i + 1], arr[i + 2]))
            answer += (B + (2 * C)) * buyThree
            arr[i] -= buyThree
            arr[i + 1] -= buyThree
            arr[i + 2] -= buyThree
        }
        
        else {
            var buyThree = min(arr[i], min(arr[i + 1], arr[i + 2]))
            answer += (B + (2 * C)) * buyThree
            arr[i] -= buyThree
            arr[i + 1] -= buyThree
            arr[i + 2] -= buyThree
            
            var buyTwo = min(arr[i], arr[i + 1])
            answer += (B + C) * buyTwo
            arr[i] -= buyTwo
            arr[i + 1] -= buyTwo
            
        }
        answer += B * arr[i]
    }
}

print(answer)

// 2 3 3 -> 5 + 7 + 7
// 2 3 3 -> 6 + 9 + 9
