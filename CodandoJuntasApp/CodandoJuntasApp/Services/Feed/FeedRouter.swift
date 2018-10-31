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
    case feed
    case tutorials
}

extension FeedRouter: TargetType {
    var baseURL: URL {
        switch self {
        case .feed:
            return URL(string: NetworkingConstants.baseURL)!

        case .tutorials:
            return URL(string: "https://raw.githubusercontent.com/CodandoJuntas/ios-app")!
        }
    }
    
    var path: String {
        switch self {
        case .feed:
            return "/contents.json"
        case .tutorials:
            return "/development/testFile.md" //"/master/testFile.md"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
            let data = [""]
            return arrayJsonSerializedUTF8(json: data)
        
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .feed:
            return nil
        case .tutorials:
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
