//
//  main.swift
//  프로그래머스 프렌즈4블록
//
//  Created by 강민성 on 2021/11/19.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
 
    var map = board.map{ $0.map{ String($0) } }
    var answer = 0
    
    var rotatedMap = Array(repeating: Array(repeating: "", count: m), count: n)
    
    var removed: [[Int]] = Array(repeating: [], count: n)
    
    for i in 0..<n {
        for j in (0..<m).reversed() {
            rotatedMap[i][m-j-1] = map[j][i]
        }
    }
    
    var check2X2: (Int, Int) -> Bool = { i, j in
        
        if rotatedMap[i + 1].count - 1 < j + 1 {
            return false
        }
        if rotatedMap[i][j] == rotatedMap[i][j+1]
            && rotatedMap[i][j] == rotatedMap[i+1][j]
            && rotatedMap[i][j] == rotatedMap[i+1][j+1] {
            return true
        }
        return false
    }
    
    while true {
        var flag = false
        
        for i in 0..<rotatedMap.count - 1 {
            if rotatedMap[i].count > 1 {
                for j in (0..<rotatedMap[i].count - 1).reversed() {
                    if check2X2(i, j) {
                        if !removed[i].contains(j) {
                            removed[i].append(j)
                        }
                        if !removed[i+1].contains(j) {
                            removed[i+1].append(j)
                        }
                        removed[i].sort(by: >)
                        removed[i+1].sort(by: >)
                        if !flag {
                            flag = true
                        }
                    }
                }
            }
        }
        
        if !flag {
            break
        }
        else {
            for i in 0..<rotatedMap.count {
                for j in 0..<removed[i].count {
                    if j != removed[i].count - 1 {
                        if removed[i][j+1]+1 == removed[i][j] {
                            rotatedMap[i].remove(at: removed[i][j])
                            answer += 1
                        }
                        else {
                            rotatedMap[i].remove(at: removed[i][j])
                            rotatedMap[i].remove(at: removed[i][j])
                            answer += 2
                        }
                    }
                    else {
                        rotatedMap[i].remove(at: removed[i][j])
                        rotatedMap[i].remove(at: removed[i][j])
                        answer += 2
                    }
                }
                removed[i].removeAll()
            }
        }
        
    }
    
    return answer
}

solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
