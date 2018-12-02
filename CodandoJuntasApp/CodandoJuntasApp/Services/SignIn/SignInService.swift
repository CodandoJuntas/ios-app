//
//  SignInService.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol SignInService {
    
    func githubLogin(_ code: String) -> Single<Response>
    
    func getUser(_ token: String) -> Single<Response>
    
}
