//
//  SearchCellViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 6.05.2024.
//

import Foundation
import UIKit

class SearchCellViewModel {
    
    private var isSearch: Bool
    private var result: [SearchResult]
    
    init(result: [SearchResult], isSearch: Bool) {
        self.result = result
        self.isSearch = isSearch
    }
    
    func isSearchResult() -> Bool {
        return isSearch
    }
    
    var listCount: Int {
        result.count
    }
    
    func getImage(by indexPath: IndexPath) -> URL {
        let url = URL(string: result[indexPath.row].artworkUrl100 ?? "")
        return url ?? Constant.emptyImageURL
    }
    
    func getCollectionPrice(by indexPath: IndexPath) -> String {
        let price = result[indexPath.row].collectionPrice
        let number = NSNumber(value: price ?? 0.0)
        return String(describing: number)
    }
    
    func getCollectionName(by indexPath: IndexPath) -> String {
        result[indexPath.row].collectionName ?? ""
    }
}
