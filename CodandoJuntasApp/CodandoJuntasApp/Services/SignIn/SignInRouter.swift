//
//  SignInRouter.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 27/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//


import Foundation
import Moya

enum SignInRouter {
    case login(_ authCode: String)
    case getUser(_ token: String)
}

extension SignInRouter: TargetType {
    
    fileprivate static let clientSecret = "2de8c8c1bad3da2697250d696a495415600d2fb9"
    fileprivate static let clientId = "0abb9f2986cacfb6de8f"
    
    var baseURL: URL {
        switch self {
        case .login(let code):
            let path = "/access_token?client_secret=\(SignInRouter.clientSecret)&client_id=\(SignInRouter.clientId)&code=\(code)"
            return URL(string: "https://github.com/login/oauth" + path)!
        case .getUser(let token):
            return URL(string: "https://api.github.com/user?" + token)!
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return ""
        case .getUser:
           return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .getUser:
            return .get
        }
       
    }
    
    var sampleData: Data {
        let data = [""]
        return arrayJsonSerializedUTF8(json: data)
        
    }
    
    var parameters: [String: Any]? {
        return nil
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

