//
//  Event.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 02/12/18.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let issues = try? newJSONDecoder().decode(Issues.self, from: jsonData)

import Foundation

typealias Events = [Event]

struct Event: Codable {
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let title: String
   // let user: User
    let labels: [Label]
    let state: String
    let locked: Bool
    let comments: Int
    let authorAssociation, body: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, labels, state, locked, comments
        //case user
        case authorAssociation = "author_association"
        case body
    }
}

struct Label: Codable {
    let id: Int
    let nodeID: String
    let url: String
    let name, color: String
    let labelDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case url, name, color
        case labelDefault = "default"
    }
}

struct EventBody {
    
    let eventTitle: String
    let labels: [Label]
    let address: String
    let date: String
    let price: String
    let description: String
    let city: String

}



