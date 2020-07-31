//
//  Extensions.swift
//  TickerFullImageView
//
//  Created by user on 31/07/2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

public extension Sequence {
    // Non-mutating sort, returning a new array:
    func sortByDescending<T: Comparable>(_ property: (Element) -> T) -> [Element] {
        return sorted(by: {property($0) > property($1)})
    }
    
    func sortByAscending<T: Comparable>(_ property: (Element) -> T) -> [Element] {
        return sorted(by: {property($0) < property($1)})
    }
}
