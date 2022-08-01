//
//  main.swift
//  백준 30
//
//  Created by 강민성 on 2022/08/01.
//

import Foundation

var arr = readLine()!.map { Int(String($0))! }

var result = arr.sorted { $0 > $1 }

var answer = ""

if result.last! != 0 || result.reduce(0, { $0 + $1 }) % 3 != 0 {
    print(-1)
}

else {
    result.forEach {
        answer += String($0)
    }
}

print(answer)
