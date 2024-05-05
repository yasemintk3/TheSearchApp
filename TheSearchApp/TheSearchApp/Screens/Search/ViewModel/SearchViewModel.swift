//
//  SearchViewModel.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation

final class SearchViewModel {
    
    private var httpClient: HttpClientProtocol?
    var appCoordinator: AppCoordinator?
    
    init(httpClient: HttpClientProtocol, appCoordinator: AppCoordinator) {
        self.httpClient = httpClient
        self.appCoordinator = appCoordinator
    }
}
