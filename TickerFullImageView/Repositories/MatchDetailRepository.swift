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
    var matchDetailImage: [MatchDetailImage]
    var id: Int = 0
    
    // MARK: Properties
    var previousMatchDetailImage: MatchDetailImage? { return getPreviousMatchDetailImage() }
    var nextMatchDetailImage: MatchDetailImage? { return getNextMatchDetailImage() }
    var currentMatchDetailImage: MatchDetailImage { return matchDetailImage[id] }
    
    init() {
        matchDetailImage = [
            MatchDetailImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/ticker-38d84.appspot.com/o/VSYJ5HW59TXoeeIA0dOOOXb5BHt1%20profilePic%20Fri%20May%2029%2017%3A04%3A09%20GMT%2B02%3A00%202020?alt=media&token=c47918c8-7545-4270-a110-fed5069e292e", imageId: "0", imageCaption: "test0"),
            MatchDetailImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/ticker-38d84.appspot.com/o/VSYJ5HW59TXoeeIA0dOOOXb5BHt11050919412Timestamp(seconds%3D1591647489%2C%20nanoseconds%3D65000000)?alt=media&token=2785faa7-e0b3-4d1a-8b74-4316d98f8daf", imageId: "1", imageCaption: "test1"),
            MatchDetailImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/ticker-38d84.appspot.com/o/VSYJ5HW59TXoeeIA0dOOOXb5BHt11592770830Timestamp(seconds%3D1591648074%2C%20nanoseconds%3D412000000)?alt=media&token=5edbeaa6-ca1e-4eed-8053-614d8ad849be", imageId: "2", imageCaption: "test2"),
            MatchDetailImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/ticker-38d84.appspot.com/o/VSYJ5HW59TXoeeIA0dOOOXb5BHt1911219946Timestamp(seconds%3D1591648074%2C%20nanoseconds%3D411000000)?alt=media&token=0364652b-b481-4792-8285-a72e4e116a9f", imageId: "3", imageCaption: "test3")
        ]
        
        sortMatchDetailImage()
        
    }
    
    private func sortMatchDetailImage(){
        
        self.matchDetailImage = matchDetailImage.sortByDescending({$0.imageId})
        
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
