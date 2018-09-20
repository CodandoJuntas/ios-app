//
//  User.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var name: String = " "
    var email: String = " "
    var auth: Bool = false
    var network: String = " "
    var languages: [String] = []
    
    
    enum CodingKeys: String, CodingKey {
        case name, network
        case languages
        case email
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.network = try container.decode(String.self, forKey: .network)
        self.languages = try container.decode([String].self, forKey: .languages)
        self.email = try container.decode(String.self, forKey: .email)
    }
}
