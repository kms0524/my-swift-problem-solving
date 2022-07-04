//
//  main.swift
//  백준 두 배열의 합
//
//  Created by 강민성 on 2022/07/04.
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

func prefixSums(A: [Int], start: Int, end: Int) -> Int {
    // 1부터 시작
    let n = A.count
    var prefixSum = Array(repeating: A[0], count: n)
    
    for i in 1...n-1 {
        prefixSum[i] = prefixSum[i-1] + A[i]
    }
    
    
    let sumStartToEnd = prefixSum[end-1] - (start-1 == 0 ? 0 : prefixSum[start - 1])
    
    return sumStartToEnd
}

var fileio = FileIO()

var T = fileio.readInt()

var n = fileio.readInt()

var arr1 = [Int]()

for i in 0..<n {
    arr1.append(fileio.readInt())
}

var m = fileio.readInt()

var arr2 = [Int]()

for i in 0..<m {
    arr2.append(fileio.readInt())
}

var prefix1 = [Int]()
var prefix2 = [Int]()

for i in 0..<arr1.count {
    var sum = arr1[i]
    prefix1.append(sum)
    
    for j in i + 1..<arr1.count {
        sum += arr1[j]
        prefix1.append(sum)
    }
}

for i in 0..<arr2.count {
    var sum = arr2[i]
    prefix2.append(sum)
    
    for j in i + 1..<arr2.count {
        sum += arr2[j]
        prefix2.append(sum)
    }
}

prefix1.sort(by: <)
prefix2.sort(by: <)


var idx1 = 0
var idx2 = prefix2.count - 1

var count = 0

while idx1 < prefix1.count, idx2 >= 0 {
    
    var sum = prefix1[idx1] + prefix2[idx2]
    if sum == T {
        var sum1 = prefix1[idx1]
        var sum2 = prefix2[idx2]
        var count1 = 0
        var count2 = 0
        
        while idx1 < prefix1.count, prefix1[idx1] == sum1 {
            count1 += 1
            idx1 += 1
        }
        
        while idx2 >= 0, prefix2[idx2] == sum2 {
            count2 += 1
            idx2 -= 1
        }
        
        count += count1 * count2
        
    }
    else if sum >= T {
        idx2 -= 1
    }
    else {
        idx1 += 1
    }
    
}

print(count)
