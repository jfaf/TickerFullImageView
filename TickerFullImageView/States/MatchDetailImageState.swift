//
//  MatchDetailImageState.swift
//  TickerFullImageView
//
//  Created by user on 30/07/2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol MatchDetailImageState {}

class MatchDetailImagePresenting: MatchDetailImageState {
    let matchDetailImage: MatchDetailImage
    let nextAvailable: Bool
    let previousAvailable: Bool

    
    init(withHero matchDetailImage: MatchDetailImage, nextAvailable next: Bool, previousAvailable previous: Bool) {
        self.matchDetailImage = matchDetailImage
        self.nextAvailable = next
        self.previousAvailable = previous
    }
}
