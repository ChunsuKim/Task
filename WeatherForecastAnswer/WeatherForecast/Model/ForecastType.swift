//
//  ForecastType.swift
//  WeatherForecast
//
//  Created by Chunsu Kim on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

enum ForecastType: Int, CaseIterable {
    case current
    case shortRange
}



// CaseIterable Example
//func testing() {
//    print(ForecastType.allCases.count)
//    for i in ForecastType.allCases {
//        print(i)
//    }
//}
