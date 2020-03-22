//
//  MusicModel.swift
//  MusicTags
//
//  Created by Jose David Bustos H on 3/21/20.
//  Copyright © 2020 Jose David Bustos H. All rights reserved.
//

import Foundation

struct MusicModel: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let wrapperType: String?
    let kind: String?
    let artistID: Int?
    let collectionID: Int?
    let trackID: Int?
    let artistName: String?
    let collectionName : String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL: String?
    let collectionViewURL: String?
    let trackViewURL: String?
    let previewURL: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let collectionHDPrice:Double?
    let trackHDPrice: Double?
    let releaseDate: String
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let Explicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let shortDescription: String?
    let longDescription: String?
    let isStreamable: Bool?
}
