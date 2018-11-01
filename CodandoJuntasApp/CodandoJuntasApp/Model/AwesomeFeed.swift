//
//  Item.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 31/10/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation

struct Item {
    
    var title: String = ""
    var description: String = ""
    var link: String = ""
    init(){}
    
}

struct Field {
    
    var title: String = ""
    var description: String = ""
    var items: [Item] = []
    init() {}
    
}
