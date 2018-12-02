//
//  User.swift
//  CodandoJuntasApp
//
//  Created by Alexandre  Vassinievski on 19/09/2018.
//  Copyright © 2018 Codando Juntas. All rights reserved.
//

import Foundation


struct User: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let name, company: String?
    let blog: String?
    let email: String?
    let hireable: Bool?
    let location: String?
    let publicRepos, publicGists, followers, following: Int?
    
    init() {
        self.login = ""
        self.id = 0
        self.nodeID = ""
        self.avatarURL = ""
        self.gravatarID = ""
        self.url = ""
        self.htmlURL = ""
        self.followersURL = ""
        self.followingURL = ""
        self.gistsURL = ""
        self.starredURL = ""
        self.subscriptionsURL = ""
        self.organizationsURL = ""
        self.reposURL = ""
        self.eventsURL = ""
        self.receivedEventsURL = ""
        self.name = ""
        self.company = ""
        self.blog = ""
        self.location = ""
        self.email = ""
        self.hireable = false
        self.publicRepos = 0
        self.publicGists = 0
        self.followers = 0
        self.following = 0
        
        
        
    }
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case name, company, blog, location, email, hireable
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
    }
}
