//
//  SearchCellViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 6.05.2024.
//

import Foundation
import UIKit

class SearchCellViewModel {
    
    // MARK: Properties
    
    private var result: [SearchResult]
    
    // MARK: Init
    
    init(result: [SearchResult]) {
        self.result = result
    }
    
    var listCount: Int {
        result.count
    }
    
    // MARK: Funcs
    
    func getImage(by indexPath: IndexPath) -> URL {
        let url = URL(string: result[indexPath.row].artworkUrl100 ?? "")
        return url ?? Constants.emptyImageURL
    }
    
    func getCollectionName(by indexPath: IndexPath) -> String {
        result[indexPath.row].collectionName ?? ""
    }
    
    func getCollectionPrice(by indexPath: IndexPath) -> String {
        let price = result[indexPath.row].collectionPrice
        let number = NSNumber(value: price ?? 0.0)
        return String(describing: number)
    }
    
    func getReleaseDate(by indexPath: IndexPath) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateString = result[indexPath.row].releaseDate ?? ""
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "01.01.1999"
        }
    }
    
    func getID(indexPath: IndexPath) -> Int {
        guard let id = result[indexPath.row].artistID else { return 0 }
        return id
    }
}
