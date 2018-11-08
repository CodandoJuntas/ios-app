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

enum regexTags: String {
    
    case categories = "##[^#]+"
    case categoryTitle = "(?<=## ).+?(?=\n)"
    case categoryDescription = "(?<=\\*).+?(?=\\*)"
    case items = "(?<=\\* ).+?(?=\n)"
    case itemTitle = "(?<=\\[).+?(?=\\])"
    case itemLink = "(?<=\\().+?(?=\\))"
    case itemDescription = "(?<=\\- ).+?(?=$)"
}

class FeedRepositoryImpl: FeedRepository {
    
    let service: FeedService
    
    init(service: FeedService) {
        self.service = service
    }
    
    func getJsonFeed() -> Single<JsonFeed> {
        return self.service.jsonFeed()
            .map(JsonFeed.self)
    }
    
    func getMdFeed() -> Observable<[MdFeed]> {
        
        return self.service.mdFeed()
            .map{String(data: $0.data, encoding: .utf8)}
            .asObservable()
            .unwrap()
            .map{self.matches(for: regexTags.categories.rawValue, in: $0)}
            .map{self.parseCategoriesList(list: $0)}
        
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
    
    func parseCategoriesList(list: [String]) -> [MdFeed] {
        
        var fields: [MdFeed] = []
        
        for item in list {
            
            var field = MdFeed()
            
            field.description = self.matches(for: regexTags.categoryDescription.rawValue, in: item).first ?? ""
            field.title = self.matches(for: regexTags.categoryTitle.rawValue, in: item).first ?? ""
            let itemList = matches(for: regexTags.items.rawValue, in: item)
            field.items = self.parseItemList(itemList: itemList)
            
            fields.append(field)
        }
       
        
        return fields
        
    }
    
    func parseItemList(itemList: [String]) -> [Item] {
        
        var items: [Item] = []
        
        for i in itemList {
            
            var item = Item()
            
            item.title = matches(for: regexTags.itemTitle.rawValue, in: i).first ?? ""
            item.description = matches(for: regexTags.itemDescription.rawValue, in: i).first ?? ""
            item.link = matches(for: regexTags.itemLink.rawValue, in: i).first ?? ""
            
            items.append(item)
        }
        
        return items
    }
    
}




//
//        return Single<[Field]>.create{ single in
//
//            _ = self.service.mdFeed().subscribe{ event in
//                switch event {
//                case let .success(response):
//
//                    if let data = String(data: response.data, encoding: .utf8) {
//                        let result = self.matches(for: regexTags.categories.rawValue, in: data)
//
//                        let fields : [Field] = result
//                            .compactMap({ (block) -> Field? in
//                                var field = Field()
//                                field.description = self.matches(for: regexTags.categoryDescription.rawValue, in: block).first ?? ""
//                                field.title = self.matches(for: regexTags.categoryTitle.rawValue, in: block).first ?? ""
//                                //field.items = self.matches(for: regexTags.categoryDescription.rawValue, in: block).first ?? ""
//                                return field
//                            })
//
//                        single(.success(fields))
//                    }
//                    else {
//                        single(.error("Fail to parse Data" as! Error))
//                    }
//
//                case let .error(error):
//                    single(.error(error))
//                }
//            }
//             return Disposables.create() {}
//
//        }
