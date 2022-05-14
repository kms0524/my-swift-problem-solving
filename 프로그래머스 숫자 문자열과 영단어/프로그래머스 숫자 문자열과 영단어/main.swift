//
//  main.swift
//  프로그래머스 숫자 문자열과 영단어
//
//  Created by 강민성 on 2021/07/25.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var newString = s
   
    newString = newString.replacingOccurrences(of: "one", with: "1")
    newString = newString.replacingOccurrences(of: "two", with: "2")
    newString = newString.replacingOccurrences(of: "three", with: "3")
    newString = newString.replacingOccurrences(of: "four", with: "4")
    newString = newString.replacingOccurrences(of: "five", with: "5")
    newString = newString.replacingOccurrences(of: "six", with: "6")
    newString = newString.replacingOccurrences(of: "seven", with: "7")
    newString = newString.replacingOccurrences(of: "eight", with: "8")
    newString = newString.replacingOccurrences(of: "nine", with: "9")
    newString = newString.replacingOccurrences(of: "zero", with: "0")
    
    return Int(newString)!
    
}
