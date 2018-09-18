//
//  DefaultContainer.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation
import Swinject
import Moya

final class DefaultContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        self.registerServices()
        self.registerViews()
        self.registerStorage()
    }
    
}

//Register Views
extension DefaultContainer {
    
    func registerViews() {
        
  
        self.container.register(MainView.self) { resolver in
            MainView()
        }
        
//        self.container.register(OnboardingView.self) { _ in
//            OnboardingView()
//        }
//
//        self.container.register(AboutView.self) { _ in
//            AboutView()
//        }
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        self.container.register(FeedService.self) { _ in
            let provider = MoyaProvider<FeedRouter>(plugins: self.getDefaultPlugins())
            return FeedServiceImpl(provider: provider)
        }
        
        self.container.register(FeedRepository.self) { resolver in
            FeedRepositoryImpl(
                service: resolver.resolve(FeedService.self)!
            )
        }
    }
    
    func getDefaultPlugins() -> [PluginType] {
        #if DEBUG
        return [NetworkLoggerPlugin(verbose: true)]
        #else
        return []
        #endif
    }
    
}

//Register Storage
extension DefaultContainer {
    
    func registerStorage() {
        
        self.container.register(LocalStorage.self) { _ in
            return LocalStorageImpl()
        }
    }
    
}
