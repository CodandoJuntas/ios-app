//
//  FeedRepositoryImpl.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class FeedRepositoryImpl: FeedRepository {

    let service: FeedService
    
    init(service: FeedService) {
        self.service = service
    }
    
    func getFeed() -> Single<Feed> {
        return self.service.feed()
        .map(Feed.self)
    }
    
    func getTutorials() -> () { //Single<[Field]> {
        
        let response = self.service.tutorials().subscribe{ event in
            switch event {
            case let .success(response):
                let data = String(data: response.data, encoding: .utf8)
                print("OK")
            case let .error(error):
                print(error)
            }
            
        }
//
//        response.debug("RESPONSE: ->>>>>>>")
    }
    
    enum regexTags: String {
        
        case categories = "##[^#]+"
        case categoryTitle = "(?<=## ).+?(?=\n)"
        case categoryDescription = "(?<=\\*).+?(?=\\*)"
        case items = "(?<=\\* ).+?(?=\n)"
        case itemTitle = "(?<=\\[).+?(?=\\])"
        case itemLink = "(?<=\\().+?(?=\\))"
        case itemDescription = "(?<=\\- ).+?(?=$)"
    }

    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let results = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
}
