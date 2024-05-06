//
//  Constant.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

struct Constant {
    
    static let BASE_URL = "https://itunes.apple.com/search?term=jack+johnson."
    static let QUERY_URL = "term="
    
    static let emptyImageURL: URL = URL(string: "https://www.swift-inc.com/public/images/images-empty.png")!
}

extension Constant {
    
    static func generateSearchURL(searchKey: String) -> URL? {
        searchKey.isEmpty ?
        URL(string: "") :
        URL(string: BASE_URL + QUERY_URL + searchKey)
    }
    
    static func generateImageURL(path: String) -> URL? {
        URL(string: path)
    }
}
