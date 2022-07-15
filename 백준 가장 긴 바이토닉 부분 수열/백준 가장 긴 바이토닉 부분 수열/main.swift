//
//  main.swift
//  백준 가장 긴 바이토닉 부분 수열
//
//  Created by 강민성 on 2022/05/31.
//

import Foundation



func lisWithBinarySearch(_ array: inout [Int]) -> Int {
    guard !array.isEmpty else {
        return 0
    }
    
    var lis = [Int](repeating: 0, count: array.count)
    
    lis[0] = array[0]
    
    var lisIndex = 0
    for i in 1..<lis.count { // 1부터 시작
        // lis의 가장 큰 값보다 더 큰값이 들어오면
        if lis[lisIndex] > array[i] {
            lisIndex += 1
            lis[lisIndex] = array[i]
        } else {
            let index = lowerBound(arr: &lis, start: 0, end: lisIndex, target: array[i])
            lis[index] = array[i]
            
//            if index != 0 {
//                pos[i] = index // 실제 경로의 index를 저장
//            }
        }
        
    }
    return lisIndex
}


func lowerBound(arr: inout [Int], start: Int, end: Int, target: Int) -> Int{
    var mid: Int
    var start = start
    var end = arr.count - 1
    
    while (end >= start) {  // 주어진 범위[start,end]에서 탐색하도록 한다. start == end이면 반복 종료
        mid = (start + end) / 2  // 주어진 범위의 중간 위치를 계산한다
        
        if (arr[mid] < target){ // 찾고자 하는 값보다 작으면 오른쪽으로 한 칸만 더 시작 구간 갱신
            end = mid - 1
        } else if arr[mid] == target {
            return mid
        }
        else {
            start = mid + 1
        }
    }
    return start; // 찾는 구간에 없는 경우 가장 마지막 +1 위치 전달
}

var arr = [1, 5, 2, 1, 4, 3, 4, 5, 2, 1]

print(lisWithBinarySearch(&arr) + 1)
