//
//  AppCoordinator.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    func start()
    func eventOccurred(id: Int)
}

class AppCoordinator: Coordinator {

    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SearchBuilder.build(appCoordinator: self)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func eventOccurred(id: Int) {
        navigationController?.pushViewController(SearchDetailBuilder.build(id: id), animated: true)
    }
}
