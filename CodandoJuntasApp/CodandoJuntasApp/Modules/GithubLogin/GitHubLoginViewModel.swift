//
//  GitHubLoginViewModel.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 26/11/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities
import RxSwiftExt

class GitHubLoginViewModel {
    
    //let input: Driver<Void>
    
    let user: Driver<User>
    
    init(accessToken: Driver<String>,
        repository: SignInRepository) {
        
        self.user = accessToken
            .asObservable()
            .flatMapLatest { (accessToken) in
            repository.login(code: accessToken)
            }
            .flatMapLatest { (acessToken) in
                repository.getUser(token: acessToken)
                    .asObservable()
                    .materialize().debug("MATERIALIZE")
            }.elements()
            .asDriver(onErrorJustReturn: User())
        
    }
    
    func match(for regex: String, in text: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
            return results.map {
                String(text[Range($0.range, in: text)!])
                }.first
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return " "
        }
    }
}
