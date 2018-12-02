//
//  EventsService.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 22/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//


import Foundation
import RxSwift
import Moya

protocol EventsService {
    func getEvents()-> Single<Response>
}

