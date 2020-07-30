//
//  MatchDetailIntent.swift
//  TickerFullImageView
//
//  Created by user on 30/07/2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MatchDetailIntent {
    var stateRelay: PublishRelay<MatchDetailImageState>
    var view: ViewController?
    let matchDetailRepository = MatchDetailRepository()
    var disposeBag = DisposeBag()
        
    init() {
        stateRelay = PublishRelay()
    }
    
    public func bind(toView view: ViewController) {
        self.view = view
        
        stateRelay.subscribe { event in
            guard let state = event.element else { return }
            self.view?.update(withState: state)
        }.disposed(by: disposeBag)
        
        let matchDetailImage = matchDetailRepository.currentMatchDetailImage
        let next = matchDetailRepository.isNextMatchDetailImageAvailable()
        let previous = matchDetailRepository.isPreviousMatchDetailImageAvailable()

        stateRelay.accept(MatchDetailImagePresenting(withMatchDetail: matchDetailImage,
                                                   nextAvailable: next,
                                                   previousAvailable: previous))
    }
    
    public func onPreviousClicked() {
        guard let matchDetailImage = matchDetailRepository.previousMatchDetailImage else { return }
        presentMatchDetailImage(matchDetailImage: matchDetailImage)
    }
    
    public func onNextClicked() {
        guard let matchDetailImage = matchDetailRepository.nextMatchDetailImage else { return }
        presentMatchDetailImage(matchDetailImage: matchDetailImage)
    }
    
    private func presentMatchDetailImage(matchDetailImage: MatchDetailImage) {
        let next = matchDetailRepository.isNextMatchDetailImageAvailable()
        let previous = matchDetailRepository.isPreviousMatchDetailImageAvailable()
        stateRelay.accept(MatchDetailImagePresenting(withMatchDetail: matchDetailImage,
        nextAvailable: next,
        previousAvailable: previous))
    }
}
