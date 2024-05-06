//
//  SearchCollectionViewCell.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 6.05.2024.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {
    
    private enum Constant {
        static let viewCornerRadius: CGFloat = 8
        static let viewCornerLineWidth: CGFloat = 1
        static let minOffSet: CGFloat = 8
    }
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        return image
    }()
    
    private var collectionPrice: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var collectionName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func configure(imageURL: URL, collectionPrice: String, collectionName: String) {
        configureCell()
        configureImage(url: imageURL)
        configurePrice(price: collectionPrice)
        configurePrice(price: collectionName)
    }
    
    private func configureCell() {
        configureUI()
        configureConstaints()
    }
    
    private func configureUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(collectionPrice)
        stackView.addArrangedSubview(collectionName)
        
        self.layer.cornerRadius = Constant.viewCornerRadius
        self.layer.borderWidth = Constant.viewCornerLineWidth
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 8
    }
    
    private func configureConstaints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    private func configureImage(url: URL) {
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.75).isActive = true
        image.kf.setImage(with: url)
    }
    
    private func configurePrice(price: String) {
        collectionPrice.text = price
    }
    
    private func configureName(name: String) {
        collectionName.text = name
    }
}
