//
//  eventsRouter.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 22/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//


import Foundation
import Moya

enum EventsRouter {
    case events
}

extension EventsRouter: TargetType {
    var baseURL: URL {
        switch self {
        case .events:
            return URL(string: "https://api.github.com/repos/CodandoJuntas")!
        }
    }
    
    var path: String {
        switch self {
        case .events:
            return "/ios-app/issues"
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
        case .events:
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
