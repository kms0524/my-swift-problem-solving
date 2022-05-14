//
//  main.swift
//  백준 단어 수학
//
//  Created by 강민성 on 2022/05/10.
//

import Foundation

var N = Int(readLine()!)!

var arr = [[String]]()

var dic = [String: Int]()
var num = 9
var sum = 0

for i in 0..<N {
    arr.append(readLine()!.map { String($0) })
}

for i in 0..<N {
    for j in 0..<arr[i].count {
        dic.updateValue(0, forKey: arr[i][j])
    }
}

for i in 0..<N {
    for j in 0..<arr[i].count {
        dic[arr[i][j]]! += Int(pow(10, Double(arr[i].count - j - 1)))
    }
}

var sorted = dic.sorted { $0.value > $1.value }

sorted.forEach {
    sum += num * $0.value
    num -= 1
}

print(sum)
