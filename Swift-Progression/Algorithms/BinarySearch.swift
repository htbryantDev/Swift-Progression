import Foundation

struct BinarySearch {
    static func search(array: [Int], searchValue: Int) -> (doesExist: Bool, iterations: Int) {
        
        var left = 0
        var right = array.count - 1
        var loopCount = 1
        
        while left <= right {
            
            let middle = Int(floor(Double(left + right) / 2.0))
            
            if array[middle] < searchValue {
                left = middle + 1
            } else if array[middle] > searchValue {
                right = middle - 1
            } else {
                return (true, loopCount)
            }
            
            loopCount += 1
        }
        
        return (false, loopCount)
    }
    
    
}
