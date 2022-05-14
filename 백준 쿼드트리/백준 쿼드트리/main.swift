//
//  main.swift
//  백준 쿼드트리
//
//  Created by 강민성 on 2022/04/26.
//

import Foundation

func check(_ minX: Int, _ minY: Int, _ maxX: Int, _ maxY: Int) -> Bool {
    for i in minY..<maxY {
        for j in minX..<maxX {
            if map[minY][minX] != map[i][j] {
                return false
            }
        }
    }
    return true
}

func solution(_ minX: Int, _ minY: Int, _ maxX: Int, _ maxY: Int) {
    if check(minX, minY, maxX, maxY) {
        answer += map[minY][minX]
    }
    else {
        answer += "("
        solution(minX, minY, maxX - (maxX - minX) / 2, maxY - (maxY - minY) / 2)
        solution(minX + (maxX - minX) / 2, minY, maxX, maxY - (maxY - minY) / 2)
        solution(minX, minY + (maxY - minY) / 2, maxX - (maxX - minX) / 2, maxY)
        solution(minX + (maxX - minX) / 2, minY + (maxY - minY) / 2, maxX, maxY)
        answer += ")"
    }
}

var N = Int(readLine()!)!
var map = [[String]]()
for i in 0..<N {
    map.append(readLine()!.map { String($0) })
}
var answer = ""

solution(0, 0, N, N)

print(answer)
