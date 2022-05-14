//
//  main.swift
//  백준 집합
//
//  Created by 강민성 on 2021/09/01.
//

/*
 
 별짓을 다해도 시간초과가 난다.
 입력까지는 FileIO로 해결되는거같으나, 출력에서 print()함수때문에
 시간초과가 나는것 같다.
 왜 swfit로 준비를했을까............
 
 */

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

let file = FileIO()

var M = file.readInt()

for _ in 0..<M {
    var answer = 0
    
    let op = file.readString()
    switch op {
    case "add":
        let num = file.readInt()
        answer |= (1 << (num - 1))
        break
    case "remove":
        let num = file.readInt()
        answer &= ~(1 << (num - 1))
        break
    case "check":
        let num = file.readInt()
        print(((answer & (1 << (num - 1))) != 0) ? 1 : 0)
        break
    case "toggle":
        let num = file.readInt()
        answer ^= (1 << (num - 1))
        break
    case "all":
        answer |= (~0)
        break
    case "empty":
        answer &= 0
        break
    default: break
    }
}


