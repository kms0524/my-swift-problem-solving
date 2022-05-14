//
//  main.swift
//  백준 직사각형에서 탈출
//
//  Created by 강민성 on 2022/04/06.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }

var xMin = min(input[2] - input[0], input[0])
var yMin = min(input[3] - input[1], input[1])
print(min(xMin, yMin))
