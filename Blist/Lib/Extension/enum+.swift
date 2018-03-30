
import Foundation
import UIKit


/**
 
 enum Fruit: Int, EnumEnumerable {
   case apple
   case banana
   case orange
 }
 
 _ = Fruit.cases // => [apple, banana, orange]
 Fruit.cases.count // => 3
 
 */
public protocol EnumEnumerable {
    associatedtype Case = Self
}

public extension EnumEnumerable where Case: Hashable {
    
    private static var iterator: AnyIterator<Case> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }
            
            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Case.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }
    
    public static func enumerate() -> EnumeratedSequence<AnySequence<Case>> {
        return AnySequence(self.iterator).enumerated()
    }

    public static var cases: [Case] {
        return Array(self.iterator)
    }
    
    public static var count: Int {
        return self.cases.count
    }
}

