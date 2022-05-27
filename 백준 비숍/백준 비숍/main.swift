//
//  main.swift
//  백준 비숍
//
//  Created by 강민성 on 2022/05/26.
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

var map = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)

for i in 1...N {
    for j in 1...N {
        map[i][j] = fileio.readInt()
    }
}

var visitedBlack = [[Bool]](repeating: [Bool](repeating: false, count: N + 1), count: N + 1)
var visitedWhite = [[Bool]](repeating: [Bool](repeating: false, count: N + 1), count: N + 1)

var dx = [1, 1, -1, -1]
var dy = [-1, 1, -1, 1]

var whiteCount = 0
var blackCount = 0

func checkWhite(_ visited : [[Bool]], _ row: Int, _ col: Int, _ count: Int) {
    
    whiteCount = max(count, whiteCount)
    
    var col = col
    var row = row
    var visited = visited
    
    if row > N {
        col += 1
        row = (col % 2 == 0) ? 1 : 2
    }
    
    if col > N {
        return
    }
    
    if isValid(visited, row, col) {
        visited[col][row] = true
        checkWhite(visited, row + 2, col, count + 1)
        visited[col][row] = false
    }
    
    checkWhite(visited, row + 2, col, count)
}

func checkBlack(_ visited : [[Bool]], _ row: Int, _ col: Int, _ count: Int) {
    
    blackCount = max(count, blackCount)
    
    var col = col
    var row = row
    var visited = visited
    
    if row > N {
        col += 1
        row = (col % 2 == 0) ? 2 : 1
    }
    
    if col > N {
        return
    }
    
    if isValid(visited, row, col) {
        visited[col][row] = true
        checkBlack(visited, row + 2, col, count + 1)
        visited[col][row] = false
    }
    
    checkBlack(visited, row + 2, col, count)
}

func isValid(_ visited: [[Bool]], _ row: Int, _ col: Int) -> Bool {
    
    if map[col][row] == 0 {
        return false
    }
    
    for i in 0..<4 {
        var xx = row + dx[i]
        var yy = col + dy[i]
        
        for j in 1...N {
            if xx <= N && xx > 0 && yy <= N && yy > 0 {
                if visited[yy][xx] {
                    return false
                }
                
                yy += dy[i]
                xx += dx[i]
                
            }
        }
    }
    
    return true
}

checkBlack(visitedBlack, 1, 1, 0)
checkWhite(visitedWhite, 2, 1, 0)

print(blackCount + whiteCount)
