//
//  SignInServiceImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case message(message: String)
    case cancel
    case requestEmail(parameters: [String: String])
    
}

class SignInServiceImpl: SignInService {
    
    func facebookLogin(_ onComplete: @escaping (String?, LoginError?) -> ()) {
        
    }
    
    func githubLogin(_ onComplete: @escaping (String?, LoginError?) -> ()) {
        
    }
    

}
