//
//  SearchBuilder.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation
import UIKit
import Alamofire

enum SearchBuilder {
    
    static func build(appCoordinator: AppCoordinator) -> SearchViewController {
        
        let httpClient = HttpClient(alamofireSession: Alamofire.Session.default)
        
        let viewModel = SearchViewModel(httpClient: httpClient, appCoordinator: appCoordinator)
        
        let delegate = SearchDelegate()
        let dataSource = SearchDataSource()
        
        let viewController = SearchViewController(viewModel: viewModel,
                                                  delegate: delegate,
                                                  dataSource: dataSource)
        
        return viewController
    }
}
