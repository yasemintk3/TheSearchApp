//
//  SearchBarDelegate.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 15.05.2024.
//

import UIKit

protocol SearchBarDelegateOutput: AnyObject {
    func searchTapped(searchKey: String)
    func resetSearch()
}

class SearchBarDelegate: NSObject {
    
    weak var output: SearchBarDelegateOutput?
    
    init(output: SearchBarDelegateOutput) {
        self.output = output
    }
}

extension SearchBarDelegate: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
        guard let searchText = searchBar.text else { return }
        
        let searchKey = searchText.replacingOccurrences(of: " ", with: "")
        
        output?.searchTapped(searchKey: searchKey)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        output?.resetSearch()
    }
}
