//
//  main.swift
//  백준 숫자 카드 2
//
//  Created by 강민성 on 2022/04/15.
//

import Foundation

let N = Int(readLine()!)!

var givenArr = readLine()!.split(separator: " ").map { Int($0)! }
var countedSet = NSCountedSet()
givenArr.forEach {
    countedSet.add($0)
}

var M = Int(readLine()!)!

var findArr = readLine()!.split(separator: " ").map { Int($0)! }

var answer = [Int]()

for i in 0..<findArr.count {
    if countedSet.contains(findArr[i]) {
        answer.append(countedSet.count(for: findArr[i]))
    }
    else {
        answer.append(0)
    }
}

answer.forEach {
    print($0, terminator: " ")
}
