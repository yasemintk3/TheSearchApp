//
//  SearchDataSource.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit

final class SearchDataSource: NSObject {
    
    private var viewModel: SearchCellViewModel?
    
    func update(cellViewModel: SearchCellViewModel) {
        self.viewModel = cellViewModel
    }
}

extension SearchDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.listCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchCollectionViewCell,
                let viewModel = viewModel else { return UICollectionViewCell() }
        
        cell.configure(imageURL: viewModel.getImage(by: indexPath),
                       collectionName: viewModel.getCollectionName(by: indexPath),
                       collectionPrice: viewModel.getCollectionPrice(by: indexPath),
                       releaseDate: viewModel.getReleaseDate(by: indexPath))
        
        return cell
    }
}
