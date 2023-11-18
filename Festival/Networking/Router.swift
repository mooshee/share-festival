//
//  Router.swift
//  Festival
//
//  Created by Daniel Hallman on 11/17/23.
//

import Foundation

enum Method: String {
    case get = "GET"
}

enum Router {
    case lineup

    var baseURL: URL {
        return URL(string: "http://localhost:8000")!
    }

    var method: Method {
        switch self {
        case .lineup: return .get
        }
    }

    var path: String {
        switch self {
        case .lineup: return "fest_lineup.json"
        }
    }

    func asURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
