//
//  FeedManager.swift
//  Instagram
//
//  Created by Chunsu Kim on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


class FeedManager {
    
    // singleton declare
    static let shared = FeedManager()
    
    // feedData Array declare
    var allFeedData = [FeedData]()
    
    private init(){}
    
    // feedData additional function
    func addFeedData(_ feedData: FeedData) {
        allFeedData.append(feedData)
    }
    
    // feedData return function
    func returnFeedData() -> [FeedData] {
        return allFeedData
    }
}
