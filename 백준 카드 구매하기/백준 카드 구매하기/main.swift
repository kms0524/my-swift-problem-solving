//
//  main.swift
//  백준 카드 구매하기
//
//  Created by 강민성 on 2022/05/30.
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

var P = [Int](repeating: 0, count: N + 1)

for i in 1..<N+1 {
    P[i] = fileio.readInt()
}

var dp = [Int](repeating: 0, count: N + 1)

for i in 1...N {
    for j in 1...i {
        dp[i] = max(dp[i-j] + P[j], dp[i])
    }
}

print(dp[N])

/*
 
 dp = n개를 구입하는 방법
 
 dp[1] = dp[0] + p[1]
 dp[2] = dp[1] + p[1] || p[2]
 dp[3] = dp[1] + p[2] || dp[2] + p[1] || p[3]
 
 
 dp[i] = max(dp[i-j] + p[j], dp[i])
 
 */
