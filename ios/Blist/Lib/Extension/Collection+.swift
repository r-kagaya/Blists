

import Foundation


extension Collection where Iterator.Element: Hashable {
    
    /** ２つの配列の重複要素を削除する */
    typealias E = Iterator.Element
    func diff(other: [E]) -> [E] {
        let all = self + other
        var counter: [E: Int] = [:]
        all.forEach { counter[$0] = (counter[$0] ?? 0) + 1 }
        return all.filter { (counter[$0] ?? 0) == 1 }
    }
    
}

