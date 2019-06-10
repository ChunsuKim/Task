//
//  Data.swift
//  ITunesAPI
//
//  Created by Chunsu Kim on 09/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation

struct ITunes: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    var artistName: String
    var artworkUrl100: String
    var trackName: String
}
