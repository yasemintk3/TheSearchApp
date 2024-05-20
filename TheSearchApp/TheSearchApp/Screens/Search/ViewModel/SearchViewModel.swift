//
//  SearchViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

enum SearchListViewModelState {
    case showSearchList(SearchCellViewModel)
    case showError(Error)
}

protocol SearchViewModelOutput: AnyObject {
    func updateView(state: SearchListViewModelState)
}

protocol SearchViewModelProtocol {
    func getSearchList(searchKey: String)
    func resetSearch()
    func getSegmentList(searchKey: String, segment: String)
    func goToDetail(id: Int)
    var output: SearchViewModelOutput? { get set }
}


final class SearchViewModel: SearchViewModelProtocol {
    
    var httpClient: HttpClientProtocol?
    var appCoordinator: AppCoordinator?
    var output: SearchViewModelOutput?
    private var searchResult: [SearchResult] = []
    var key: String = ""
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
    
    func getSearchList(searchKey: String) {
        
        httpClient?.fetch(url: Constants.generateSearchURL(searchKey: searchKey)!, completion: { (result: Result<Search, Error>) in
            
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    return print("error")
                }
                let viewModel = SearchCellViewModel(result: results, isSearch: true)
                self.output?.updateView(state: .showSearchList(viewModel))
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
        
        key = searchKey
    }
    
    func resetSearch() {
        let viewModel = SearchCellViewModel(result: self.searchResult, isSearch: false)
        output?.updateView(state: .showSearchList(viewModel))
        key = ""
    }
    
    func getSegmentList(searchKey: String, segment: String) {
        
        httpClient?.fetch(url: Constants.generateSegmentURL(searchKey: searchKey, segment: segment)!, completion: { (result: Result<Search, Error>) in
            
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    return print("error")
                }
                let viewModel = SearchCellViewModel(result: results, isSearch: true)
                self.output?.updateView(state: .showSearchList(viewModel))
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
    
    func goToDetail(id: Int) {
        appCoordinator?.eventOccurred(id: id)
    }
}
