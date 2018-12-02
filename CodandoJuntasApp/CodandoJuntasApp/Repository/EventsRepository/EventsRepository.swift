//
//  EventsRepository.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 27/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import Moya
import Firebase

//self.register(EventsRepository.self) { resolver in
//    EventsRepositoryImpl(
//        service: resolver.resolve(<#ServiceName#>.self)!
//    )
//}

protocol EventsRepository: class {
    func getEvents() -> Single<Events>
}
