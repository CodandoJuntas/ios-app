//
//  SignInService.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation

protocol SignInService {
    
    func facebookLogin(_ onComplete: @escaping (String?, LoginError?) -> ())
    func githubLogin(_ onComplete: @escaping (String?, LoginError?) -> ()) 
    
}
