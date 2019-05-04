import Foundation

//var input = [5, 6, 1, 3, 10, 2, 7, 14, 9]
var inputCases = [
    [],
    [1],
    [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
    [14, 10, 9, 7, 6, 5, 3, 2, 1],
    [1, 2, 3, 5, 6, 7, 9, 10, 14],
    [5, 6, 1, 3, 10, 2, 7, 14, 9],
    [1, 2, 3, 4, 5, 6]
]

func bubbleSort(input: inout [Int]) {
    guard !input.isEmpty else { return }
    
    for i in 1..<input.count {
        // 정렬이 끝났을 때 for in 문을 더이상 돌리지 않게 방지
        var isSorted = true     // 정렬이 됐을 경우 true -> break로 빠져나감
        
        for idx in 0..<input.count - i {
            guard input[idx] > input[idx + 1] else { continue }
            input.swapAt(idx, idx + 1)
            print("\(i):", input)
            
            isSorted = false    // 안됐을 경우 false
            
            // MARK: - swapAt description
//            let temp = input[idx]
//            input[idx] = input[idx + 1]
//            input[idx + 1] = temp
        }
        if isSorted { break }
    }
}

for input in inputCases {
    var input = input
    
    bubbleSort(input: &input)
    print(input)

}

