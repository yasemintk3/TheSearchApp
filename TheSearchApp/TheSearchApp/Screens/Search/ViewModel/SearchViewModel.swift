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
    var output: SearchViewModelOutput? { get set }
    
    func getSearchList(searchKey: String)
    func resetSearch()
    func getSegmentList(searchKey: String, segment: String)
    func goToDetail(id: Int)
    func getKeyURL() -> String
}

final class SearchViewModel: SearchViewModelProtocol {
    
    // MARK: Properties

    weak var output: SearchViewModelOutput?
    private var httpClient: HttpClientProtocol?
    private var appCoordinator: AppCoordinator?
    private var searchResult: [SearchResult] = []
    private var keyURL: String = ""
    
    // MARK: Init
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
    
    // MARK: Funcs
    
    func getSearchList(searchKey: String) {
        
        httpClient?.fetch(url: Constants.generateSearchURL(searchKey: searchKey)!, completion: { (result: Result<Search, Error>) in
            
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    return print("error")
                }
                let viewModel = SearchCellViewModel(result: results)
                self.output?.updateView(state: .showSearchList(viewModel))
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
        
        keyURL = searchKey
    }
    
    func resetSearch() {
        let viewModel = SearchCellViewModel(result: self.searchResult)
        output?.updateView(state: .showSearchList(viewModel))
        keyURL = ""
    }
    
    func getSegmentList(searchKey: String, segment: String) {
        
        httpClient?.fetch(url: Constants.generateSegmentURL(searchKey: searchKey, segment: segment)!, completion: { (result: Result<Search, Error>) in
            
            switch result {
            case .success(let response):
                guard let results = response.results else {
                    return print("error")
                }
                let viewModel = SearchCellViewModel(result: results)
                self.output?.updateView(state: .showSearchList(viewModel))
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
    
    func getKeyURL() -> String {
        return keyURL
    }
    
    func goToDetail(id: Int) {
        appCoordinator?.eventOccurred(id: id)
    }
}
