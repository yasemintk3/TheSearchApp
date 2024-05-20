//
//  SearchDetail.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 20.05.2024.
//

import Foundation

// MARK: - SearchDetail
struct SearchDetail: Codable {
    let resultCount: Int?
    let results: [SearchDetailResult]?
}

// MARK: - Result
struct SearchDetailResult: Codable {
    let wrapperType, artistType, artistName: String?
    let artistLinkURL: String?
    let artistID, amgArtistID: Int?
    let primaryGenreName: String?
    let primaryGenreID: Int?

    enum CodingKeys: String, CodingKey {
        case wrapperType, artistType, artistName
        case artistLinkURL = "artistLinkUrl"
        case artistID = "artistId"
        case amgArtistID = "amgArtistId"
        case primaryGenreName
        case primaryGenreID = "primaryGenreId"
    }
}
