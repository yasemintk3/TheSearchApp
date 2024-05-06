//
//  SearchDataSource.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit

final class SearchDataSource: NSObject {
    
    private var viewModel: SearchCellViewModel?
    private var isSearchResult: Bool?
    
    func update(cellViewModel: SearchCellViewModel) {
        self.viewModel = cellViewModel
        self.isSearchResult = cellViewModel.isSearchResult()
    }
}

extension SearchDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.listCount ?? 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell,
                let viewModel = viewModel else { return UICollectionViewCell() }
        
        cell.configure(imageURL: viewModel.getImage(by: indexPath),
                       collectionPrice: viewModel.getCollectionName(by: indexPath),
                       collectionName: viewModel.getCollectionPrice(by: indexPath))
        
        return cell
    }
}
