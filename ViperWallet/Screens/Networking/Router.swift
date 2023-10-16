//
//  Router.swift
//  ViperWallet
//
//  Created by Mahmut Gazi Doğan on 16.10.2023.
//

import Foundation
import Alamofire

public enum Router: URLRequestConvertible {
    
    case marketInfos
    case getSpecificTickerInfo(parameters: Parameters)
    
    var baseURL: URL {
        guard let url = URL(string: "https://www.bitexen.com") else {
            fatalError("Failed to create URL.")
        }
        return url
    }
    
    private var method: HTTPMethod {
        switch self {
        case .marketInfos, .getSpecificTickerInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .marketInfos:
            return "/api/v1/market_info/"
        case .getSpecificTickerInfo(let marketCode):
            return "/api/v1/ticker/\(marketCode)/"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .marketInfos:
            return [:]
        case .getSpecificTickerInfo(let parameters):
            return parameters
        }
    }
    
    private var headers: HTTPHeaders {
        switch self {
        case .marketInfos, .getSpecificTickerInfo:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers
        
        let encoding: ParameterEncoding = {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }()
    return try encoding.encode(urlRequest, with: parameters)
    }
}
