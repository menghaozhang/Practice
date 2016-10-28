//
//  Model.swift
//  Practice
//
//  Created by paul on 28/10/16.
//  Copyright © 2016 Menghao. All rights reserved.
//

import Gloss

struct Content: Decodable {
    let playlist: Playlist?
    let a = "a"
    
    init?(json: JSON) {
        self.playlist = "playlist" <~~ json
    }
}

struct Playlist: Decodable{
    let a: [Entry]?
    init?(json: JSON) {
        self.a = "a" <~~ json
    }
}

struct Entry: Decodable {
    let title: String?
    let artist: String?
    let label: String?
    let image: String?
    let playlist: String?
    let artist_id: String?
    let status: String?
    
    init?(json: JSON) {
        self.title = "title" <~~ json
        self.artist = "artist" <~~ json
        self.label = "label" <~~ json
        self.image = "image" <~~ json
        self.playlist = "playlist" <~~ json
        self.artist_id = "artist_id" <~~ json
        self.status = "status" <~~ json
    }
}
