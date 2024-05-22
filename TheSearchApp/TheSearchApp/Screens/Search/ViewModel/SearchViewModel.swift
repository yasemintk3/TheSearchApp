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
    func getSegmentList(searchKey: String)
    func goToDetail(id: Int)
    func getKeyURL(index: Int) -> String
}

final class SearchViewModel: SearchViewModelProtocol {
    
    // MARK: Properties

    weak var output: SearchViewModelOutput?
    private var httpClient: HttpClientProtocol?
    private var appCoordinator: AppCoordinator?
    private var searchResult: [SearchResult] = []
    private var keyURL: String = ""
    private var segment: String = ""
    
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
    
    func getSegmentList(searchKey: String) {
        
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
    
    func getKeyURL(index: Int) -> String  {
        
        switch index {
        case 0:
            segment = Constants.SegmentPathURL.movie.rawValue
            return keyURL
        case 1:
            segment = Constants.SegmentPathURL.music.rawValue
            return keyURL
        case 2:
            segment = Constants.SegmentPathURL.apps.rawValue
            return keyURL
        case 3:
            segment = Constants.SegmentPathURL.books.rawValue
            return keyURL
        default:
            break
        }
        return ""
    }
    
    func goToDetail(id: Int) {
        appCoordinator?.eventOccurred(id: id)
    }
}
