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
    
}
