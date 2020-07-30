//
//  MatchDetailRepository.swift
//  TickerFullImageView
//
//  Created by user on 30/07/2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class MatchDetailRepository {
    // MARK: State
    let matchDetailImage: [MatchDetailImage]
    var id: Int = 0
    
    // MARK: Properties
    var previousMatchDetailImage: MatchDetailImage? { return getPreviousMatchDetailImage() }
    var nextMatchDetailImage: MatchDetailImage? { return getNextMatchDetailImage() }
    var currentMatchDetailImage: MatchDetailImage { return matchDetailImage[id] }
    
    init() {
        matchDetailImage = [
            MatchDetailImage(imageUrl: "test.com", imageId: "0", imageCaption: "test0"),
            MatchDetailImage(imageUrl: "test.com", imageId: "1", imageCaption: "test1"),
            MatchDetailImage(imageUrl: "test.com", imageId: "2", imageCaption: "test2"),
            MatchDetailImage(imageUrl: "test.com", imageId: "3", imageCaption: "test3")
        ]
    }
    
    private func getNextMatchDetailImage() -> MatchDetailImage? {
        if !isNextMatchDetailImageAvailable() { return nil }
        id += 1
        return matchDetailImage[id]
    }
    
    public func getPreviousMatchDetailImage() -> MatchDetailImage? {
        if !isPreviousMatchDetailImageAvailable() { return nil }
        id -= 1
        return matchDetailImage[id]
    }
    
    public func isNextMatchDetailImageAvailable() -> Bool {
        return matchDetailImage.count - 1 > id
    }
    
    public func isPreviousMatchDetailImageAvailable() -> Bool {
        return id > 0
    }
}
