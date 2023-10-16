//
//  NetworkingManager.swift
//  ViperWallet
//
//  Created by Mahmut Gazi Doğan on 16.10.2023.
//

import Foundation
import Alamofire

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    func routerRequest<T: Decodable>(request: URLRequestConvertible,
                                     callback: @escaping (Result<T, Error>) -> Void) {
        AF.request(request)
            .validate()
            .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                callback(.success(value))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
}
