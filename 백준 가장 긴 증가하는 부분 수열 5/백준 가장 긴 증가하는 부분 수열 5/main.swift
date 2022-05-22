//
//  main.swift
//  백준 가장 긴 증가하는 부분 수열 5
//
//  Created by 강민성 on 2022/05/22.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<(index-1)])
    }
}

func lisWithBinarySearch(_ array: inout [Int]) -> Int {
    guard !array.isEmpty else {
        return 0
    }
    
    var lis = [Int](repeating: 0, count: array.count)
    var pos = [Int](repeating: 1, count: array.count)
    lis[0] = array[0]
    
    var lisIndex = 1
    for i in 1..<lis.count { // 1부터 시작
        // lis의 가장 큰 값보다 더 큰값이 들어오면
        if lis[lisIndex-1] < array[i] {
            lis[lisIndex] = array[i]
            lisIndex += 1
            pos[i] = lisIndex // 실제 경로의 index를 저장
        } else {
            let index = lowerBound(arr: &lis, start: 0, end: lisIndex, target: array[i])
            lis[index - 1] = array[i]
            
            if index != 0 {
                pos[i] = index // 실제 경로의 index를 저장
            }
        }
        
    }
    
    backtrace(&array, &pos, array.count - 1, lisIndex)
    return lisIndex
}

func backtrace(_ array: inout [Int], _ pos: inout [Int], _ idx: Int, _ last: Int) {
    
    if idx < 0 {
        return
    }
    
    if pos[idx] == last {
        backtrace(&array, &pos, idx - 1, last - 1)
        // lisArr 생성하기
        lisArr.append(array[idx])
    }
    else {
        backtrace(&array, &pos, idx - 1, last);
    }
}

func lowerBound(arr: inout [Int], start: Int, end: Int, target: Int) -> Int{
    var mid: Int
    var start = start
    var end = end
    
    while (end - start > 0) {  // 주어진 범위[start,end]에서 탐색하도록 한다. start == end이면 반복 종료
        mid = (start + end) / 2  // 주어진 범위의 중간 위치를 계산한다
        
        if (arr[mid] < target){ // 찾고자 하는 값보다 작으면 오른쪽으로 한 칸만 더 시작 구간 갱신
            start = mid + 1
        } else {// 찾고자 하는 값보다 크면 거기까지 끝 구간 갱신
            end = mid;
        }
    }
    return end + 1; // 찾는 구간에 없는 경우 가장 마지막 +1 위치 전달
}

var fileio = FileIO()

var A = fileio.readInt()

var arr = [Int]()
var lisArr = [Int]()

for i in 0..<A {
    arr.append(fileio.readInt())
}

lisWithBinarySearch(&arr)

var str = lisArr.description
str.removeFirst()
str.removeLast()
var answer = str.replacingOccurrences(of: ",", with: "")

print(lisArr.count)
print(answer)
