//
//  main.swift
//  백준 2048 (Easy)
//
//  Created by 강민성 on 2022/07/12.
//

import Foundation

/*
 https://please-amend.tistory.com/entry/백준-12100번-2048-Easy-스위프트Swift-풀이-그림-설명
 CaseIterable 처음써보는데 괜찮은듯으로 보임
 */


enum Direction: CaseIterable {
    case up, down, left, right
}

var N = Int(readLine()!)!

var map = [[Int]]()

var answer = 0

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func move(_ dir: Direction, _ map : [[Int]]) -> [[Int]] {
    
    var map = map
    
    for i in 0..<N {
        var line: [Int]
        
        switch dir {
        case .up :
            line = (0..<N).map { map[$0][i] }
        case .down :
            line = (0..<N).reversed().map { map[$0][i] }
        case .left :
            line = map[i]
        case .right :
            line = map[i].reversed()
        }
        
        var movedLine = line.filter {
            $0 != 0
        }
        
        guard !movedLine.isEmpty else {
            continue
        }
        
        for j in 0..<movedLine.count - 1 {
            guard movedLine[j] == movedLine[j + 1] else {
                continue
            }
            movedLine[j] *= 2
            movedLine[j + 1] = 0
        }
        
        movedLine = movedLine.filter {
            $0 != 0
        }
        
        while movedLine.count < N {
            movedLine.append(0)
        }
        
        switch dir {
        case .up :
            (0..<N).forEach { map[$0][i] = movedLine[$0] }
        case .down :
            (0..<N).forEach { map[N - 1 - $0][i] = movedLine[$0] }
        case .left :
            map[i] = movedLine
        case .right :
            map[i] = movedLine.reversed()
        }
    }
    return map
}

func play(_ depth: Int, _ map: [[Int]]) {
    if depth > 5 {
        for i in 0..<N {
            for j in 0..<N {
                answer = max(answer, map[i][j])
            }
        }
    }
    
    else {
        for dir in Direction.allCases {
            var movedMap = move(dir, map)
            play(depth + 1, movedMap)
        }
    }
}

play(1, map)

print(answer)
