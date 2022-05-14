//
//  main.swift
//  백준 직각삼각형
//
//  Created by 강민성 on 2022/04/14.
//

import Foundation

while true {
    var input = readLine()!.split(separator: " ").map { Double($0)! }
    
    if input == [0, 0, 0] {
        break
    }
    
    input = input.map { $0 * $0 }
    
    input.sort()
    
    if input[2] == input[0] + input[1] {
        print("right")
    }
    else {
        print("wrong")
    }
}
