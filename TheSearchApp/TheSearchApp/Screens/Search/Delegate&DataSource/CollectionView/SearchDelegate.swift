//
//  SearchDelegate.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit

protocol SearchDelegateOutput: AnyObject {
    func didSelectItem(id: Int)
}

class SearchDelegate: NSObject {
    
    private var viewModel: SearchCellViewModel?
    private weak var output: SearchDelegateOutput?
    
    func update(cellViewModel: SearchCellViewModel, output: SearchDelegateOutput) {
        self.viewModel = cellViewModel
        self.output = output
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        output?.didSelectItem(id: viewModel.getID(indexPath: indexPath))
    }
}
