//
//  main.swift
//  백준 나이순 정렬
//
//  Created by 강민성 on 2022/04/15.
//

import Foundation

var arr = [(Int, String, Int)]()
var N = Int(readLine()!)!

for i in 0..<N {
    var input = readLine()!.split(separator: " ").map { String($0) }
    var age = Int(input[0])!
    var name = input[1]
    
    arr.append((age, name, i))
}

var sortedArr = arr.sorted {
    if $0.0 == $1.0 {
        return $0.2 < $1.2
    }
    return $0.0 < $1.0
}

sortedArr.forEach {
    print("\($0.0) \($0.1)")
}
