//
//  SearchViewController.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
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
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private var viewModel: SearchViewModel?
    private var delegate: SearchDelegate?
    private var dataSource: SearchDataSource?
    
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
        
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationItem.searchController = searchBar
        
        configureContraints()
        configureDelegate()
    }
    
    private func configureDelegate() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func configureContraints() {
        
        view.addSubview(collectionView)
        view.addSubview(segmentedControl)
        
        segmentedController()
        searchCollection()
    
    }
    
    private func segmentedController() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
    }
    
    private func searchCollection() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
    }

    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Segment değiştiğinde yapılacak işlemleri buraya ekleyebilirsiniz
    }
}

extension SearchViewController: SearchViewModelOutput {
    func updateView(list: [SearchResult]) {
    }
}
