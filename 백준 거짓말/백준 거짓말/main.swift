//
//  main.swift
//  백준 거짓말
//
//  Created by 강민성 on 2022/04/26.
//

import Foundation

// 배열의 원소를 자기 자신을 root로 초기화하기
//for i in 1...N  {
//    parent[i] = i
//}

func find(_ value: Int) -> Int {
    if parent[value] == value {
        return value
    }
    
    parent[value] = find(parent[value])
    return parent[value]
}

func union(_ a: Int, _ b: Int) {
    let aRoot = find(a)
    let bRoot = find(b)
    parent[aRoot] = bRoot
}

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]

var tempInput = readLine()!
var truth = [Int]()
var arr = [[Int]]()
var parent = [Int]()

var answer = 0
parent = [Int](0...N + 1)

truth = Array(tempInput.split(separator: " ").map { Int($0)! }.dropFirst())
for i in 0..<M {
    var input = Array(readLine()!.split(separator: " ").map { Int($0)! }.dropFirst())
    arr.append(input)
}
if tempInput == "0" {
    print(M)
}
else {
    
    arr.forEach { participants in
        for i in 0..<participants.count - 1 {
            union(participants[i], participants[i + 1])
        }
    }
    
    for i in 0..<truth.count - 1 {
        union(truth[i], truth[i + 1])
    }
    
    arr.forEach { participants in
        if find(participants.first!) != find(truth.first!) {
            answer += 1
        }
    }
    print(answer)
}
