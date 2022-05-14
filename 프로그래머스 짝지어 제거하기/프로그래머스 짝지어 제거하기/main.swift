//
//  main.swift
//  프로그래머스 짝지어 제거하기
//
//  Created by 강민성 on 2021/11/02.
//

import Foundation


func solution(_ s:String) -> Int{
    
    if s.count % 2 == 1 {
        return 0
    }
    
    var stack: [Character] = []
    let arr = Array(s)
    
    for i in arr.indices {
        if stack.isEmpty {
            stack.append(arr[i])
        }
        else {
            if stack.last! == arr[i] {
                stack.removeLast()
            }
            else {
                stack.append(arr[i])
            }
        }
    }
    return stack.isEmpty ? 1 : 0
}

print(solution("baabaa"))
