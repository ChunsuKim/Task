//
//  Logger.swift
//  CustomLogExample
//
//  Created by giftbot on 28/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

func logger (
    _ contents: Any...,
    header: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line
    ) {
    
    let emoji = "🥺"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    
    let fileUrl = URL(fileURLWithPath: file)
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    
    let header = header.isEmpty ? "" : " [ \(header) ] -"
    let content = contents.reduce("") { $0 + " " + String(describing: $1) }
    
    print("\(emoji) \(timestamp) / \(file) / \(function)  (\(line)) \(header) \(content)")
    //    \n 다음줄로 넘기기
    
    print("\(emoji) \(timestamp) / \(fileName) / \(function) (\(line)) \(header) \(content)")
}
