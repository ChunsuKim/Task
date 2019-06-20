//
//  Data.swift
//  WeatherXML
//
//  Created by Chunsu Kim on 19/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

let baseURL = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"

let xmlParser = XMLParser(contentsOf: URL(string: baseURL)!)
//guard let xmlParser = XMLParser(contentsOf: URL(string: baseURL)!) else { return }
