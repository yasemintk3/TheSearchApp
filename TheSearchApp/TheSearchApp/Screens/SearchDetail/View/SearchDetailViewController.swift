//
//  SearchDetailViewController.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 20.05.2024.
//

import UIKit
import Kingfisher
import SnapKit

class SearchDetailViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var artistType: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var artistName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var genreName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private var viewModel: SearchDetailViewModelProtocol?
    
    init(viewModel: SearchDetailViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
        viewModel?.output = self
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(artistType)
        stackView.addArrangedSubview(artistName)
        stackView.addArrangedSubview(genreName)
        
        configureConstraint()
    }
    
    private func configureConstraint() {
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.size.height / 6)
        }
    }
    
    private func setData() {
        guard let viewModel = viewModel else {
            return
        }
        
        artistType.text = viewModel.getArtistType()
        artistName.text = viewModel.getArtistName()
        genreName.text = viewModel.getGenreName()
    }
    
}

extension SearchDetailViewController: SearchDetailViewModelOutput {
    func updateState(_ state: SearchDetailViewModelState) {
        switch state {
        case .setData:
            self.setData()
        case .showError(let error):
            print(error)
        }
    }
}
