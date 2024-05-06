//
//  SearchViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

protocol SearchViewModelOutput: AnyObject {
    func updateView(list: [SearchResult])
}

protocol SearchViewModelProtocol {
    func getSearchList(searchKey: String)
    var output: SearchViewModelOutput? { get set }
}

final class SearchViewModel: SearchViewModelProtocol {

    var httpClient: HttpClientProtocol?
    var appCoordinator: AppCoordinator?
    var output: SearchViewModelOutput?
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
    
    func getSearchList(searchKey: String) {
        
        httpClient?.fetch(url: Constant.generateSearchURL(searchKey: searchKey)!, completion: { (result: Result<Search, Error>) in
            
            switch result {
            case .success(let response):
                guard let list = response.results else {
                    return print("error")
                }
                self.output?.updateView(list: list)
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
}
