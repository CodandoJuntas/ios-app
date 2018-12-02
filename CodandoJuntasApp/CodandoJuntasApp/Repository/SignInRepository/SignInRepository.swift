//
//  SignInRepository.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import Moya

//self.register(SignInRepository.self) { resolver in
//    SignInRepositoryImpl(
//        service: resolver.resolve(<#ServiceName#>.self)!
//    )
//}

protocol SignInRepository: class {
    
    func login(code: String) -> Single<String>
    
    func getUser(token: String) -> Single<User>
}
