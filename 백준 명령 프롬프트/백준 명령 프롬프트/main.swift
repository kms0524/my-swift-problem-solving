//
//  main.swift
//  백준 명령 프롬프트
//
//  Created by 강민성 on 2022/08/01.
//

import Foundation

var N = Int(readLine()!)!

var arr = [String]()

for i in 0..<N {
    arr.append(readLine()!)
}

var result = arr[0]

if arr.count == 1 {
    print(result)
}

else {
    var first = result.map { String($0) }
    
    for i in 1..<arr.count {
        var compare = arr[i].map { String($0) }
        for j in 0..<arr[0].count {
            if first[j] != compare[j] {
                first[j] = "?"
            }
        }
    }
    var answer = ""
    first.forEach {
        answer += $0
    }
    print(answer)
}
