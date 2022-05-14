//
//  main.swift
//  백준 동전 0
//
//  Created by 강민성 on 2022/05/07.
//

import Foundation

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var arr = [Int]()

for i in 0..<N {
    arr.append(Int(readLine()!)!)
}

arr.sort {
    $0 > $1
}

var count = 0
while K != 0 {
    if arr.first! > K {
        arr.removeFirst()
    }
    
    else {
        K -= arr.first!
        count += 1
    }
}

print(count)
