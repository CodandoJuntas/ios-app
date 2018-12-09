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
                feedRepository: resolver.resolve(FeedRepository.self)!,
                storage: resolver.resolve(LocalStorage.self)!,
                tableViewHeader: resolver.resolve(FeedHeaderView.self)!
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
        
        self.container.register(GitHubLoginView.self) { resolver in
            GitHubLoginView(repository: resolver.resolve(SignInRepository.self)!)
        }
        
        self.container.register(WebContainerView.self){ resolver in
            WebContainerView()
        }
        
        self.container.register(FeedHeaderView.self) { resolver in
            FeedHeaderView(
                eventsRepository: resolver.resolve(EventsRepository.self)!)
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
            let provider = MoyaProvider<SignInRouter>(plugins: self.getDefaultPlugins())
            return SignInServiceImpl(provider: provider)
        }
        
        self.container.register(EventsService.self) { _ in
            let provider = MoyaProvider<EventsRouter>(plugins: self.getDefaultPlugins())
            return EventsServiceImpl(provider: provider)
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
        
        self.container.register(EventsRepository.self){ resolver in
            EventsRepositoryImpl(
                service: resolver.resolve(EventsService.self)!
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
