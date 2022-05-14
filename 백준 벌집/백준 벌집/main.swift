//
//  main.swift
//  백준 벌집
//
//  Created by 강민성 on 2022/04/11.
//

import Foundation

var N = Int(readLine()!)!

var current = 1
var count = 1
if N == 1 {
    print("1")
}
else {
    while true {
        if N <= current {
            print(count)
            break
        }
        current += (count * 6)
        count += 1
    }
}


