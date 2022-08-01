//
//  main.swift
//  백준 소트인사이드
//
//  Created by 강민성 on 2022/07/31.
//

import Foundation

var input = readLine()!.map { Int(String($0))! }

var result = input.sorted { $0 > $1 }

var ansewr = ""

result.forEach {
    ansewr += String($0)
}

print(ansewr)
