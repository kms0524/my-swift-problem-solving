//
//  main.swift
//  백준 멀티탭 스케쥴링
//
//  Created by 강민성 on 2022/05/11.
//

import Foundation

var NK = readLine()!.split(separator: " ").map { Int($0)! }

var N = NK[0]
var K = NK[1]

var arr = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0

var dic = [Int: Int]()

for i in 0..<arr.count {
    dic[arr[i]] = 0
}

for i in 0..<arr.count {
    dic[arr[i]]! += 1
}

var remain = N

for i in 0..<arr.count {
    var current = arr[i]
    
    if remain > 0 {
        remain -= 1
        dic[arr[i]]! -= 1
    }
    else {
        
    }
}

print(dic)
