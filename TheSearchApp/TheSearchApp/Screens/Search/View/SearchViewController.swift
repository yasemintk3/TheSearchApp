//
//  SearchViewController.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
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

    }
}
