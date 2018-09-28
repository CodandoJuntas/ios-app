//
//  MainViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa

class FeedViewModel {
    
    //let input: Driver<Void>
    let repository: FeedRepository
    let storage: LocalStorage
    let projects: Driver<[Project]>
    let categories: Driver<[Category]>
    var projectsFeed: [Project] = []
    var categoriesFeed: [Category] = []


    
    init(feedRepository: FeedRepository, storage: LocalStorage) {
        self.repository = feedRepository
        self.storage = storage
        
        let result = repository.getFeed()
        .asObservable()
        .share()
        
        self.categories = result.map{$0.categories}
            .map { $0.filter { $0.subTitle != nil }}
            .asDriver(onErrorJustReturn: [])
        
        self.projects = result.map{$0.projects}
            .asDriver(onErrorJustReturn: [])
        
    }
}
