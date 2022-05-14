//
//  main.swift
//  프로그래머스 광고 삽입
//
//  Created by 강민성 on 2021/08/19.
//

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    
    let totalPlayTime = timeFormatter(time: play_time)
    
    var totalArr = Array(repeating: 0, count: totalPlayTime + 1)
    
    let totalAdTime = timeFormatter(time: adv_time)
    
    for log in logs {
        
        let SE = log.split(separator: "-")
        let logStart = SE[0]
        let logEnd = SE[1]
        
        let tuple = (String(logStart), String(logEnd))
        
        let start = timeFormatter(time: tuple.0)
        let end = timeFormatter(time: tuple.1)
        
        totalArr[start] += 1
        totalArr[end] -= 1
        
    }
    
    for i in 1..<totalPlayTime {
        totalArr[i] += totalArr[i - 1]
    }
    
    for i in 1..<totalPlayTime {
        totalArr[i] += totalArr[i - 1]
    }
    
    var sum = totalArr[totalAdTime - 1]
    
    var idx = 0
    
    for i in totalAdTime..<totalPlayTime {
        
        if sum < totalArr[i] - totalArr[i - totalAdTime] {
            sum = totalArr[i] - totalArr[i - totalAdTime]
            idx = i - totalAdTime + 1
        }
    }
    
    let answer = reTimeFormatter(time: idx)
    
    print(answer)
    
    return answer
}

func timeFormatter(time: String) -> Int {
    let splitedTime = time.split(separator: ":").map{ Int($0)! }
    
    let hour = splitedTime[0] * 3600
    let min = splitedTime[1] * 60
    let sec = splitedTime[2] * 1
    
    let totalTime = hour + min + sec
    
    return totalTime
}

func reTimeFormatter(time: Int) -> String {
   
    let hour = 0...9 ~= time / 3600 ? "0\(time / 3600)" :
    "\(time / 3600)"
    let min = 0...9 ~= time / 60 % 60 ? "0\(time / 60 % 60)" :
    "\(time / 60 % 60)"
    let sec = 0...9 ~= time % 60 ? "0\(time % 60)" :
    "\(time % 60)"
    
    let totalTime = "\(hour):\(min):\(sec)"
    
    return totalTime
}

solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"])

