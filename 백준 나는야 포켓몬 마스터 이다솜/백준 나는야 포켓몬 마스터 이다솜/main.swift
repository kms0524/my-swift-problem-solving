//
//  main.swift
//  백준 나는야 포켓몬 마스터 이다솜
//
//  Created by 강민성 on 2022/04/24.
//

import Foundation

var NM = readLine()!.split(separator: " ").map { Int($0)! }

var N = NM[0]
var M = NM[1]

var dic1 = [String: Int]()
var dic2 = [Int: String]()

var inputArr = [String]()
for i in 0..<N {
    let input = readLine()!
    dic1.updateValue(i + 1, forKey: input)
    dic2.updateValue(input, forKey: i + 1)
}

for _ in 0..<M {
    let question = readLine()!
    
    if question.isNumber {
        print(dic2[Int(question)!]!)
    }
    else {
        print(dic1[question]!)
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
