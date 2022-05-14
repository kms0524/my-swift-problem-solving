//
//  main.swift
//  프로그래머스 괄호 회전하기
//
//  Created by 강민성 on 2021/11/14.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var answer = 0
    let s = s
    var arr = s.map{String($0)}
    var copiedArr = arr
    
    for _ in 0..<arr.count {
        
        var flag = true
        
        if checkClosed(s: arr.first!) {
            copiedArr = rotateArray(array: &copiedArr)
            arr = copiedArr
            continue
        }
        
        
        var stack: [String] = []
        
        stack.append(arr.first!)
        arr.removeFirst()
        
        while !arr.isEmpty {
            
            
            if !checkClosed(s: arr.first!) {
                stack.append(arr.first!)
                arr.removeFirst()
            }
            else {
                
                if stack.isEmpty {
                    flag = false
                    break
                }
                
                if checkPair(current: stack.last!, next: arr.first!) {
                    stack.removeLast()
                    arr.removeFirst()
                }
                else {
                    flag = false
                    break
                }
            }
        }
        
        if flag == true && stack.isEmpty {
            answer += 1
        }
        
        copiedArr = rotateArray(array: &copiedArr)
        arr = copiedArr
        
    }
    
    print(answer)
    
    return answer
}

func checkClosed (s: String) -> Bool {
    
    if s == "]" || s == "}" || s == ")" {
        return true
    }
    else {
        return false
    }
}

func checkPair (current: String, next: String) -> Bool {
    
    if current == "{" {
        if next == "}" {
            return true
        }
        else {
            return false
        }
    }
    
    if current == "(" {
        if next == ")" {
            return true
        }
        else {
            return false
        }
    }
    
    else {
        if next == "]" {
            return true
        }
        else {
            return false
        }
    }
    
}

func rotateArray(array:inout [String]) -> [String] {
    var array = array
    
    array.append(array.first!)
    array.removeFirst()
    
    return array
    
}

solution("[](){}")
