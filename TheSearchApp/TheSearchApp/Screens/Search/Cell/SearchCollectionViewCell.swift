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
        stackView.spacing = 4
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
    
    private var collectionName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var collectionPrice: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 11)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var releaseDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func configure(imageURL: URL, collectionName: String, collectionPrice: String, releaseDate: String) {
        configureCell()
        configureImage(url: imageURL)
        configureName(name: collectionName)
        configurePrice(price: collectionPrice)
        configureReleaseDate(date: releaseDate)
    }
    
    private func configureCell() {
        configureUI()
        configureConstaints()
    }
    
    private func configureUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(collectionName)
        stackView.addArrangedSubview(collectionPrice)
        stackView.addArrangedSubview(releaseDate)
        
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
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.9).isActive = true
        image.kf.setImage(with: url)
    }
    
    private func configureName(name: String) {
        collectionName.text = name
    }
    
    private func configurePrice(price: String) {
        collectionPrice.text = price + "$"
    }
    
    private func configureReleaseDate(date: String) {
        releaseDate.text = date
    }
}
