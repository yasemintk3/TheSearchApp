//
//  SearchDetailBuilder.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 20.05.2024.
//

import Foundation
import UIKit
import Alamofire

enum SearchDetailBuilder {
    
    static func build(id: Int) -> SearchDetailViewController {
        
        let httpClient = HttpClient(alamofireSession: Alamofire.Session.default)
        
        let viewModel = SearchDetailViewModel(id: id, httpClient: httpClient)
        
        let viewController = SearchDetailViewController(viewModel: viewModel)
        
        return viewController
    }
}
