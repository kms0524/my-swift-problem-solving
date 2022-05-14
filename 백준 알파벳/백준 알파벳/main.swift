//
//  main.swift
//  백준 알파벳
//
//  Created by 강민성 on 2021/08/30.
//

/*
 백준은 swift 판정이 쓰레기....
 FileIO 사용법:
 입력값을 주고 엔터 대신 컨트롤+D 를 눌러서 EOF를 사용한다
 
 판정때문에 일반적인 DFS로 풀리진않고 비트마스크를 사용해야 통과가 가능한듯
 */


import Foundation

// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}


let file = FileIO()

var R = file.readInt()
var C = file.readInt()

var map = Array(repeating: [Int](), count: R)

var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]

var answer = 0


for i in 0..<R {
    let input = Array(readLine()!).map{ Int($0.asciiValue! - 65) }
    map[i] = input
}


func dfs(x: Int, y: Int, bit: Int, count: Int) {
    
    answer = answer > count ? answer : count
    
    for i in 0..<dx.count {
        let xx = x + dx[i]
        let yy = y + dy[i]
        
        if yy < 0 || yy >= C || xx < 0 || xx >= R {
            continue
        }
        let nextBit = 1 << map[xx][yy]
        
        if bit & nextBit == 0 {
            dfs(x: xx, y: yy, bit: bit | nextBit, count: count + 1)
        }
    }
}

dfs(x: 0, y: 0, bit: 1 << map[0][0], count: 1)

print(answer)
