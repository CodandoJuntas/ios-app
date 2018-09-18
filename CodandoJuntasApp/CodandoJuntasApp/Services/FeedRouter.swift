//
//  FeedRouter.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import Moya

enum FeedRouter {
    case categories
}

extension FeedRouter: TargetType {
    var baseURL: URL {
        return URL(string: NetworkingConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .categories:
            return "/contents.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .categories:
            let data = ["category_test1", "category_test2", "category_test3"]
            return arrayJsonSerializedUTF8(json: data)
            
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .categories:
            return nil
        }
    }
    
    var task: Task {
        if let `parameters` = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        } else {
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
