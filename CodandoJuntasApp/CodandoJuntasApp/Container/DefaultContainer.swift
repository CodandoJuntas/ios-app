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
        
  
        self.container.register(FeedView.self) { resolver in
            FeedView(
                repository: resolver.resolve(FeedRepository.self)!,
                storage: resolver.resolve(LocalStorage.self)!
            )
        }
        
        self.container.register(OnboardingView.self) { _ in
            OnboardingView()
        }

        self.container.register(LoginView.self) { resolver in
            LoginView(
                repository: resolver.resolve(SignInRepository.self)!,
                storage: resolver.resolve(LocalStorage.self)!
            )
        }
        
        self.container.register(ProfileView.self) { resolver in
            ProfileView(
                storage: resolver.resolve(LocalStorage.self)!
            )
        }
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        self.container.register(FeedService.self) { _ in
            let provider = MoyaProvider<FeedRouter>(plugins: self.getDefaultPlugins())
            return FeedServiceImpl(provider: provider)
        }
        
        self.container.register(SignInService.self) { _ in
            return SignInServiceImpl()
        }
        
        self.container.register(FeedRepository.self) { resolver in
            FeedRepositoryImpl(
                service: resolver.resolve(FeedService.self)!
            )
        }
        
        self.container.register(SignInRepository.self) { resolver in
            SignInRepositoryImpl(
                service: resolver.resolve(SignInService.self)!
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
