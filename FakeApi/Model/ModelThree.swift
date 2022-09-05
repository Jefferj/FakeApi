//
//  ModelThree.swift
//  FakeApi
//
//  Created by Jefferson Naranjo rodríguez on 4/09/22.
//

import Foundation

struct ModelThree: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
