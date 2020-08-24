import Foundation

struct Sort {
    static func bubble<Element: Comparable>(_ array: inout [Element]) -> Double? {
        guard array.count >= 2 else {
            return nil
        }
        
        let start = CFAbsoluteTimeGetCurrent()
        
        // A single-pass bubbles the largest value to the end of the collection. Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
        
        for end in (1..<array.count).reversed() {
            var swapped = false
            // This loop performs a single pass; it compares adjacent values and swaps them if needed.
            for current in 0..<end {
                if array[current] > array[current + 1] {
                    array.swapAt(current, current + 1)
                    swapped = true
                }
            }
            
            // If no values were swapped this pass, the collection must be sorted, and you can exit early.
            if !swapped {
                return (CFAbsoluteTimeGetCurrent() - start)
            }
        }
        return (CFAbsoluteTimeGetCurrent() - start)
    }
    
    static func selection<Element: Comparable>(_ array: inout [Element]) -> Double? {
        guard array.count >= 2 else {
            return nil
        }
        
        let start = CFAbsoluteTimeGetCurrent()
        
        for current in 0..<(array.count - 1) {
            var lowest = current
            
            for other in (current + 1)..<array.count {
                if array[lowest] > array[other] {
                    lowest = other
                }
            }
            
            if lowest != current {
                array.swapAt(lowest, current)
            }
        }
        
        return CFAbsoluteTimeGetCurrent() - start
    }
    
    static func insertion<Element: Comparable>(_ array: inout [Element]) -> Double? {
        guard array.count >= 2 else {
            return nil
        }
        
        let start = CFAbsoluteTimeGetCurrent()
        
        // Compare value from the left, so ignore the 1st index
        for current in 1..<array.count {
            for shifting in (1...current).reversed() {
                if array[shifting] < array[shifting - 1] {
                    array.swapAt(shifting, shifting - 1)
                } else {
                    break
                }
            }
            
        }
        
        return CFAbsoluteTimeGetCurrent() - start
    }
}
