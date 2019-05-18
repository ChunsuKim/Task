//
//  FeedManager.swift
//  Instagram
//
//  Created by Wi on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


// 매니저 클래스의 유무는 선택사항입니다.

class FeedManager {
    
    static let shared = FeedManager()
    
    var allFeedData = [FeedData]()
    
    private init(){}
    
    func addFeedData(_ feedData: FeedData) {
        allFeedData.append(feedData)
    }
    
    func returnFeedData() -> [FeedData] {
        return allFeedData
    }
    
}
