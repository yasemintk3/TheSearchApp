//
//  HttpClient.swift
//  TheSearchApp
//
//  Created by Yasemin TOK on 5.05.2024.
//

import Foundation
import Alamofire

typealias resultClosure<T: Codable> = (Result<T, Error>) -> Void

protocol HttpClientProtocol: AnyObject {
    func fetch<T: Codable>(url: URL, completion: @escaping resultClosure<T>)
}

class HttpClient: HttpClientProtocol {
    
    private var alamofireSession: Session
    
    init(alamofireSession: Session) {
        self.alamofireSession = alamofireSession
    }
    
    func fetch<T>(url: URL, completion: @escaping resultClosure<T>) where T : Decodable, T : Encodable {
        
        alamofireSession.request(url, method: .get).responseDecodable(of: T.self) { data in
            
            guard let data = data.value else {
                return print("error")
            }
            completion(.success(data))
        }
    }
}
