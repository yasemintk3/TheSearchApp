//
//  SearchDelegate.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit

class SearchDelegate: NSObject {
    
    private var viewModel: SearchCellViewModel?
    private var isSearchResult: Bool?
    
    func update(cellViewModel: SearchCellViewModel) {
        self.viewModel = cellViewModel
        self.isSearchResult = cellViewModel.isSearchResult()
    }
}

extension SearchDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let size = SearchCellSize(flowLayout: flowLayout,
                                                width: UIScreen.main.bounds.size.width)
            return size.estimatedItemSize
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
           isSearchResult ?? false {
            let size = SearchCellSize(flowLayout: flowLayout,
                                                width: UIScreen.main.bounds.size.width)
            return size.headerSize
        }
        return .zero
    }
}
