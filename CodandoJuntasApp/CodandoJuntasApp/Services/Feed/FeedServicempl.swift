//
//  FeedServicempl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class FeedServiceImpl: FeedService {
    
    let provider: MoyaProvider<FeedRouter>
    
    init(provider: MoyaProvider<FeedRouter>) {
        self.provider = provider
    }
    
    func feed() -> Single<Response> {
        return self.provider.rx.request(.feed)
    }
    
}
