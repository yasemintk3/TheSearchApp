//
//  Constants.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

struct Constants {
    
    static let BASE_URL = "https://itunes.apple.com/"
    static let QUERY_URL = "search?term="
    static let SEGMENT_URL = "&entity="
    static let LOOKUP_URL = "lookup?id="
    
    static let emptyImageURL: URL = URL(string: "https://www.swift-inc.com/public/images/images-empty.png")!
}

extension Constants {
    
    static func generateSearchURL(searchKey: String) -> URL? {
        URL(string: BASE_URL + QUERY_URL + searchKey)
    }
    
    static func generateImageURL(path: String) -> URL? {
        URL(string: path)
    }
    
    static func generateSegmentURL(searchKey: String, segment: String) -> URL? {
        URL(string: BASE_URL + QUERY_URL + searchKey + SEGMENT_URL + segment)
    }
    
    static func generateDetailURL(id: Int) -> URL? {
        URL(string: BASE_URL + LOOKUP_URL + String(id))
    }
}
