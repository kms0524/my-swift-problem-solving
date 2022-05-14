//
//  main.swift
//  프로그래머스 오픈채팅방
//
//  Created by 강민성 on 2021/09/06.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    
    
    let events = ["Enter": "님이 들어왔습니다.", "Leave": "님이 나갔습니다."]
    var dic = [String: String]()
    
    record.forEach {
        
        let log = $0.components(separatedBy: " ")
        if log.count > 2 {
            dic[log[1]] = log[2]
        }
    }
    
    return record.filter { !$0.contains("Change") }.map { (value: String) -> String  in
        let filterd = value.components(separatedBy: " ")
        let answer = dic[filterd[1]]! + events[filterd[0]]!
        
        return answer
    }
    
}
