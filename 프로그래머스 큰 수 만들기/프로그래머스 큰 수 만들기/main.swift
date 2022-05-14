//
//  main.swift
//  프로그래머스 큰 수 만들기
//
//  Created by 강민성 on 2021/11/16.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    /*
     ===========
     1231234
     
     4332
     ===========
     4177252841
     
     7 / 7252841
     
     77 / 252841
     
     775 / 22841
     
     7758 / 2241
     
     775841 / 22
     ===========
     */
    
    var arr = Array(number)
    var idx1 = 0
    var idx2 = k
    
    var max = 0
    var answer = ""
    
    for i in 0..<arr.count - k {
        if idx1 != idx2 {
            max = 0
            for j in idx1...idx2 {
                guard let num = Int(String(arr[j])) else {
                    break
                }
                if num == 9 {
                    max = num
                    idx1 = j + 1
                    break
                }
                else if num > max {
                    max = num
                    idx1 = j + 1
                }
            }
        }
        else {
            for j in arr[idx1...(arr.count - 1)] {
                answer += String(j)
            }
            break
        }
        answer += String(max)
        idx2 += 1
    }
    
    print(answer)
    return ""
}

solution("4177252841", 4)
