//
//  SearchViewController.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private enum Constant {
        static let searchHeight: CGFloat = 40
    }
    
    private lazy var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Search"
        return search
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Movies", "Music", "Apps", "Books"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentedControl.heightAnchor.constraint(equalToConstant: segmentedControl.intrinsicContentSize.height).isActive = true
        return segmentedControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchCollectionViewCell.reuseIdentifier
        )
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private var viewModel: SearchViewModel?
    private var delegate: SearchDelegate?
    private var dataSource: SearchDataSource?
    private var searchBarDelegate: SearchBarDelegate?
    
    init(viewModel: SearchViewModel,
         delegate: SearchDelegate,
         dataSource: SearchDataSource) {
        self.viewModel = viewModel
        self.delegate = delegate
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.output = self
        searchBarDelegate = SearchBarDelegate(output: self)
        
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationItem.searchController = searchBar
        
        configureDelegate()
        configureContraints()
    }
    
    private func configureDelegate() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let sizeCalculator = SearchCellSize(flowLayout: flowLayout, width: UIScreen.main.bounds.size.width)
            collectionView.contentInset = sizeCalculator.contentInset
            collectionView.collectionViewLayout = sizeCalculator.getFlowLayout()
        }
        
        searchBar.searchBar.delegate = searchBarDelegate
    }
    
    private func configureContraints() {
        
        view.addSubview(segmentedControl)
        view.addSubview(collectionView)
        
        segmentedController()
        searchCollection()
    
    }
    
    private func segmentedController() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }
    
    private func searchCollection() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(8)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }

    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Segment değiştiğinde yapılacak işlemleri buraya ekleyebilirsiniz
    }
}

extension SearchViewController: SearchViewModelOutput {
    
    func updateView(state: SearchListViewModelState) {
        switch state {
        case .showSearchList(let searchCellViewModel):
            delegate?.update(cellViewModel: searchCellViewModel)
            dataSource?.update(cellViewModel: searchCellViewModel)
            collectionView.reloadData()
        case .showError(let error):
            print(error.localizedDescription)
        }
    }
}

extension SearchViewController: SearchBarDelegateOutput {
    func searchTapped(searchKey: String) {
        viewModel?.getSearchList(searchKey: searchKey)
    }
}
