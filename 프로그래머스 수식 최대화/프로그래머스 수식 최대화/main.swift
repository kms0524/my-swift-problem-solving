//
//  main.swift
//  프로그래머스 수식 최대화
//
//  Created by 강민성 on 2021/10/30.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    
    let expression = expression
    
    var maxValue = 0
    
    var expressionArr: [String] = []
    var str = ""
    var operArr: [[String]] = [
        ["+", "-", "*"],
        ["+", "*", "-"],
        ["-", "+", "*"],
        ["-", "*", "-"],
        ["*", "-", "+"],
        ["*", "+", "-"]
    ]
    
    expression.map {
        if $0 == "+" || $0 == "-" || $0 == "*" {
            expressionArr.append(str)
            str = ""
            expressionArr.append("\($0)")
        }
        else {
            str += "\($0)"
        }
    }
    expressionArr.append(str)
    
    for priority in operArr {
        var arr = expressionArr
        for op in priority  {
            while arr.contains(op) {
                let idx = arr.firstIndex(of: op)!
                let operand = arr.remove(at: idx + 1)
                
                switch op {
                case "+" :
                    arr[idx - 1] = String(Int(arr[idx - 1])! + Int(operand)!)
                case "-" :
                    arr[idx - 1] = String(Int(arr[idx - 1])! - Int(operand)!)
                default :
                    arr[idx - 1] = String(Int(arr[idx - 1])! * Int(operand)!)
                }
                arr.remove(at: idx)
            }
        }
        
        maxValue = max(maxValue, abs(Int(arr.first!)!))
    }
    
    return Int64(maxValue)
}
