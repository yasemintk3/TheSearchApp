//
//  SearchDetailViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 20.05.2024.
//

import Foundation

enum SearchDetailViewModelState {
    case setData
    case showError(String)
}

protocol SearchDetailViewModelProtocol {
    var output: SearchDetailViewModelOutput? { get set }
    
    func getArtistType() -> String
    func getArtistName() -> String
    func getGenreName() -> String
}

protocol SearchDetailViewModelOutput: AnyObject {
    func updateState(_ state: SearchDetailViewModelState)
}

class SearchDetailViewModel: SearchDetailViewModelProtocol {

    var detail: [SearchDetailResult]?
    private var id: Int
    private var httpClient: HttpClientProtocol
    var output: SearchDetailViewModelOutput?
    
    init(id: Int, httpClient: HttpClientProtocol) {
        self.id = id
        self.httpClient = httpClient
        
        self.getDetailPage()
    }
    
    private func getDetailPage() {
        
        httpClient.fetch(url: Constants.generateDetailURL(id: id)!, completion: { [self] (result: Result<SearchDetail, Error>) in
            
            switch result {
            case .success(let response):
                self.detail = response.results
                self.output?.updateState(.setData)
            case .failure(let error):
                return print(error.localizedDescription)
            }
        })
    }
    
    func getArtistType() -> String {
        detail?[0].artistType ?? ""
    }
    
    func getArtistName() -> String {
        detail?[0].artistName ?? ""
    }
    
    func getGenreName() -> String {
        detail?[0].primaryGenreName ?? ""
    }
}
