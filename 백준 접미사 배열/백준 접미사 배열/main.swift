//
//  main.swift
//  백준 접미사 배열
//
//  Created by 강민성 on 2022/08/01.
//

import Foundation

var S = readLine()!

var arr = [String]()

for i in 1...S.count {
    arr.append(String(S.suffix(i)))
}

arr.sort()

arr.forEach {
    print($0)
}
