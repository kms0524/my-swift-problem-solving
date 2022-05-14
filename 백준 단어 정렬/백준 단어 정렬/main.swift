//
//  main.swift
//  백준 단어 정렬
//
//  Created by 강민성 on 2022/04/06.
//

import Foundation

var N = Int(readLine()!)!

var original = [String]()

for i in 0..<N {
    original.append(readLine()!)
}

var arr = Array(Set(original))

arr.sort {
    $0.count < $1.count || ($0.count == $1.count && $0 < $1)
}


arr.forEach {
    print($0)
}
