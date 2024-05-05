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
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType?
    let kind: Kind?
    let collectionID, trackID: Int?
    let artistName, collectionName, trackName, collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double?
    let trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: Date?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country?
    let currency: Currency?
    let primaryGenreName: String?
    let contentAdvisoryRating: ContentAdvisoryRating?
    let shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let artistID: Int?
    let artistViewURL: String?
    let isStreamable: Bool?
    let collectionArtistName: CollectionArtistName?

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

enum CollectionArtistName: String, Codable {
    case jackJohnson = "Jack Johnson"
    case tomRussell = "Tom Russell"
    case variousArtists = "Various Artists"
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum ContentAdvisoryRating: String, Codable {
    case pg = "PG"
    case pg13 = "PG-13"
    case r = "R"
    case unrated = "Unrated"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
}

enum WrapperType: String, Codable {
    case track = "track"
}
