//
//  SignInServiceImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import Moya

enum LoginError: Error {
    case message(message: String)
    case cancel
    case requestEmail(parameters: [String: String])
    
}

class SignInServiceImpl: SignInService {
    
    let provider: MoyaProvider<SignInRouter>
    
    init(provider: MoyaProvider<SignInRouter>) {
        self.provider = provider
    }
    
    func githubLogin(_ code: String) -> Single<Response> {
        return provider.rx.request(.login(code))
    }
    
    func getUser(_ token: String) -> Single<Response> {
        return provider.rx.request(.getUser(token))
    }
    
}

