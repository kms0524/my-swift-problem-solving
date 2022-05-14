//
//  main.swift
//  백준 N과 M (2)
//
//  Created by 강민성 on 2021/08/25.
//


/*
 
 조합 코드 참조: https://jcsoohwancho.github.io/2021-04-17-Swift에서-효율적으로-배열쓰기/
 
 */

import Foundation

var input = readLine()!.split(separator: " ").map{ Int($0)! }

var N = input[0]
var M = input[1]

var arr = Array(repeating: 0, count: N)

for i in 0..<arr.count {
    arr[i] += i + 1
}

func getCombination<T>(elements: Array<T>, select: Int, repetition: Bool) -> [[T]] {
    guard select > 0 else {
        return [[]]
    }
    
    guard let firstElement = elements.first else {
        return []
    }
    
    let head = [firstElement]
    let subCombination = getCombination(elements: repetition ? elements :  Array(elements.dropFirst()), select: select - 1, repetition: repetition)
    
    var combination = subCombination.map { $0 + head }
    combination += getCombination(elements: Array(elements.dropFirst()), select: select, repetition: repetition)
    
    
    return combination
}

var sol = getCombination(elements: arr, select: M, repetition: true)

var answer = ""
for i in 0..<sol.count {
    sol[i].sort()
    
    for j in 0..<M {
        answer.append(String(sol[i][j]) + " ")
    }
    
    print(answer)
    answer = ""
}

