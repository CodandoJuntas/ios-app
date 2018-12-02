//
//  SignInRepositoryImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class SignInRepositoryImpl: SignInRepository {

    let service: SignInService
    
    init(service: SignInService) {
        self.service = service
    }
    
    func login(code: String) -> Single<String> {
        
       return self.service.githubLogin(code)
            .filterSuccessfulStatusCodes()
            .mapString()
        
       // .map{String(data: $0.data, encoding: .utf8)}
        
    }
    
    func getUser(token: String) -> Single<User> {
        return self.service.getUser(token).map(User.self)
    }
    
    
}
