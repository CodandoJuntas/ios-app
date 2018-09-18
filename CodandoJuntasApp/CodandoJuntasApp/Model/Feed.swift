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
}

struct Category: Codable {
    let title, id: String
    let description, parent: String?
}

struct Project: Codable {
    let title, category, description: String
    let homepage: String
    let tags: [String]?
    let swift: Int?
}
