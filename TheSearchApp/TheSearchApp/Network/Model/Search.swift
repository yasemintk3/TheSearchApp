//
//  Search.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let resultCount: Int?
    let results: [SearchResult]?
}

// MARK: - Result
struct SearchResult: Codable {
    let wrapperType: String?
    let kind: String?
    let collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let artistID: Int?
    let artistViewURL: String?
    let isStreamable: Bool?
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
        case artistID = "artistId"
        case artistViewURL = "artistViewUrl"
        case isStreamable, collectionArtistName
    }
}
