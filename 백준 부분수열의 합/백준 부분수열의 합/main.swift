//
//  main.swift
//  백준 부분수열의 합
//
//  Created by 강민성 on 2021/08/28.
//

import Foundation

var NS = readLine()!.split(separator: " ").map{ Int(String($0))! }
var N = NS[0]
var S = NS[1]

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var count = 0

func combination(index: Int, sum: Int) {
    
    if index >= N {
        return
    }
    
    if sum + arr[index] == S {
        count += 1
    }
    combination(index: index + 1, sum: sum)
    combination(index: index + 1, sum: sum + arr[index])
}

combination(index: 0, sum: 0)
print(count)

//var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
//
//var result = [[Int]]()
//var select = 1
//var count = 0
//
//func getCombination<T>(elements: Array<T>, select: Int, repetition: Bool) -> [[T]] {
//    guard select > 0 else {
//        return [[]]
//    }
//
//    guard let firstElement = elements.first else {
//        return []
//    }
//
//    let head = [firstElement]
//    let subCombination = getCombination(elements: repetition ? elements :  Array(elements.dropFirst()), select: select - 1, repetition: repetition)
//
//    var combination = subCombination.map { $0 + head }
//    combination += getCombination(elements: Array(elements.dropFirst()), select: select, repetition: repetition)
//
//
//    return combination
//}
//
//for _ in 0..<N {
//
//    result = getCombination(elements: arr, select: select, repetition: false)
//
//    for j in 0..<result.count {
//        let sum = result[j].reduce(0, +)
//        if sum == S {
//            count += 1
//        }
//    }
//    select += 1
//}
//
//print(count)
