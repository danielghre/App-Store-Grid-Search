//
//  Models.swift
//  App Store Grid Search
//
//  Created by Daniel Ghrenassia on 19/09/2020.
//

import Foundation

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let copyright, name, artworkUrl100, releaseDate: String
}
