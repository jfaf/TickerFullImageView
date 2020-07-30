//
//  ViewController.swift
//  TickerFullImageView
//
//  Created by user on 30/07/2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var previousImage: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageCaption: UILabel!
    
    
    private let intent = MatchDetailIntent()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindButtons()
        intent.bind(toView: self)
    }
    
    public func update(withState state: MatchDetailImageState) {
            switch state {
            case is MatchDetailImagePresenting:
                let matchDetailImageState = state as! MatchDetailImagePresenting
                showPresentState(withPresentState: matchDetailImageState)
                break
            default:
                break
            }
        }
        
        private func showPresentState(withPresentState state: MatchDetailImagePresenting) {
            let matchDetailImage = state.matchDetailImage
            imageCaption.text = matchDetailImage.imageCaption
            nextImage.isEnabled = state.nextAvailable
            previousImage.isEnabled = state.previousAvailable
        }
        
        
        // MARK: Methods
        private func bindButtons() {
            previousImage.rx.tap.bind {
                self.intent.onPreviousClicked()
            }.disposed(by: disposeBag)
            
            nextImage.rx.tap.bind {
                self.intent.onNextClicked()
            }.disposed(by: disposeBag)
            
          
        }
        
}


