//
//  main.swift
//  백준 통계학
//
//  Created by 강민성 on 2022/04/08.
//

import Foundation

var N = Int(readLine()!)!
var arr = [Int]()
var dic = [Int: Int]()

for i in 0..<N {
    var num = Int(readLine()!)!
    arr.append(num)
    dic[num, default: 0] += 1
}

var mostFrequent = dic.max(by: { $0.value < $1.value })!.value
dic = dic.filter { $0.value == mostFrequent }
var sorted = dic.sorted { $0.key < $1.key }

arr.sort()

var sum = arr.reduce(0) { $0 + $1 }
var div = Double(sum) / Double(N)

print(Int(round(div)))
print(arr[N/2])
if sorted.count > 1 {
    print(sorted[1].key)
}
else {
    print(sorted[0].key)
}
print(arr[N-1] - arr[0])

