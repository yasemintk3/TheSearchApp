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
    
    // MARK: Properties
    
    weak var output: SearchBarDelegateOutput?
    
    // MARK: Init
    
    init(output: SearchBarDelegateOutput) {
        self.output = output
    }
}

// MARK: Extensions

extension SearchBarDelegate: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
        guard let searchText = searchBar.text else { return }
        
        let searchKey = searchText.replacingOccurrences(of: " ", with: "")
        
        output?.searchTapped(searchKey: searchKey)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        output?.resetSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output?.resetSearch()
    }
}
