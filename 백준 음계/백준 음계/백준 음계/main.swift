//
//  main.swift
//  백준 음계
//
//  Created by 강민성 on 2022/03/31.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
var mixed = false
var ascOrDesc = false

if input[0] == 1 {
    for i in 0..<input.count - 1 {
        if input[i] != i + 1 {
            mixed = true
        }
    }
    
    if mixed == false {
        ascOrDesc = true
    }
}
else if input[0] == 8 {
    for i in 0..<input.count - 1 {
        if input[i] != 8 - i {
            mixed = true
        }
    }
    if mixed == false {
        ascOrDesc = false
    }
}
else {
    mixed = true
}

print(mixed == true ? "mixed" : (ascOrDesc == true ? "ascending" : "descending") )
