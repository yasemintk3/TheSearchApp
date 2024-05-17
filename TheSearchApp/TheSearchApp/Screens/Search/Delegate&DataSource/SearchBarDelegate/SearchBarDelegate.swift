//
//  SearchBarDelegate.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 15.05.2024.
//

import UIKit

protocol SearchBarDelegateOutput: AnyObject {
    func searchTapped(searchKey: String)
}

class SearchBarDelegate: NSObject {
    
    weak var output: SearchBarDelegateOutput?
    
    init(output: SearchBarDelegateOutput) {
        self.output = output
    }
}

extension SearchBarDelegate: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
        guard let searchKey = searchBar.text else { return }
        
        output?.searchTapped(searchKey: searchKey)
    }
}
