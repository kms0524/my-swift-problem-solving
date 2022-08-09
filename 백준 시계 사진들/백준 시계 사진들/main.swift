//
//  main.swift
//  백준 시계 사진들
//
//  Created by 강민성 on 2022/08/09.
//

import Foundation

/*
 
 a 최대깂을 3으로 기준했을때
 
                    , - ~ ~ ~ - ,
                , ' \         /   ' ,
              ,      \   0   /        ,
            ,         \     /         ,
            ,          \   /            ,
            ,    3      \ /      1      ,
            ,            /\             ,
             ,          /  \           ,
              ,        / 2  \         ,
                ,     /      \     , '
                  ' - , _ _ _ ,  '
 
 으로 가정하자. (원래는 선에 시계 바늘이 들어가는 거지만...)
 input 이
 2
 0 2
 3 1
 로 들어오면 0,2 와 1,3 은 그림 방향을 돌리면 같은 그림이 된다.
 
 arr1 = [Int](repeating: 0, count: 4)
 arr2 = [Int](repeating: 0, count: 4)
 
 으로 선언하고 각 인덱스에 (0, 2)에 들어간 값을 1로 바꿔준다. 그러면,
 
 arr1 = [1, 0, 1, 0]
 arr2 = [0, 1, 0, 1] 가 된다.
 
 이후는 KMP...
 */

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

var n = fileio.readInt()

var input1 = [Int]()
var input2 = [Int]()
for _ in 0..<n {
    input1.append(fileio.readInt())
}

for _ in 0..<n {
    input2.append(fileio.readInt())
}

var arr1 = [Int](repeating: 0, count: 360000)
var arr2 = [Int](repeating: 0, count: 360000)

input1.forEach {
    arr1[$0] = 1
}

input2.forEach {
    arr2[$0] = 1
}

arr2 = arr2 + arr2


func kmpFail(_ pattern: [Int]) -> [Int] {
    
    var patternArr = pattern
    
    var pi = [Int](repeating: 0, count: pattern.count)
    
    var j = 0
    
    for i in 1..<pattern.count {
        while (j > 0 && patternArr[i] != patternArr[j]) {
            j = pi[j - 1]
        }
        if patternArr[i] == patternArr[j] {
            j += 1
            pi[i] = j
        }
    }
    
    return pi
}

func kmp(_ pi: [Int], _ string: [Int], _ pattern: [Int]) -> Bool {
    
//    var count = 0
//    var answer = 0
    var j = 0
    
    for i in 0..<string.count {
        while j > 0 && string[i] != pattern[j] {
            j = pi[j - 1]
        }
        
        if string[i] == pattern[j] {
            if j == pattern.count - 1 {
                return true
            }
            else {
                j += 1
            }
        }
    }
    
    return false
    
}


var pi = kmpFail(arr1)

var answer = kmp(pi, arr2, arr1)

print(answer ? "possible" : "impossible")
