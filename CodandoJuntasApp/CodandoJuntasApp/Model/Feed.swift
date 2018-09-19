//
//  Feed.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 17/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation

// To parse the JSON, add this file to your project and do:
//
//   let feedAttachments = try? newJSONDecoder().decode(FeedAttachments.self, from: jsonData)


struct Feed: Codable {
    let title, header, headerContributing: String
    let iosAppLink: String
    let categories: [Category]
    let projects: [Project]
    
    enum CodingKeys: String, CodingKey {
        case title, header
        case headerContributing = "header_contributing"
        case iosAppLink = "ios_app_link"
        case categories, projects
    }
    
    init() {
        self.title = ""
        self.header = ""
        self.headerContributing = ""
        self.iosAppLink = ""
        self.categories = []
        self.projects = []
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.header = try container.decode(String.self, forKey: .header)
        self.headerContributing = try container.decode(String.self, forKey: .headerContributing)
        self.iosAppLink = try container.decode(String.self, forKey: .iosAppLink)
        self.categories = try container.decode([Category].self, forKey: .categories)
        self.projects = try container.decode([Project].self, forKey: .projects)
        
    }
}

struct Category: Codable {
    let title, id: String
    let description, parent: String?
    
    enum CodingKeys: String, CodingKey {
        case title, id
        case description, parent
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.id = try container.decode(String.self, forKey: .id)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.parent = try container.decodeIfPresent(String.self, forKey: .parent)
    }
}

struct Project: Codable {
    let title, category, description: String
    let homepage: String
    let tags: [String]?
    let swift: Int?
    
    enum CodingKeys: String, CodingKey {
        case title, category, description
        case homepage, tags, swift
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.category = try container.decode(String.self, forKey: .category)
        self.description = try container.decode(String.self, forKey: .description)
        self.homepage = try container.decode(String.self, forKey: .homepage)
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags)
        self.swift = try container.decodeIfPresent(Int.self, forKey: .swift)
    }
}
