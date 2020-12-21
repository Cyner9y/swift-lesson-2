//
//  User.swift
//  VkClient
//
//  Created by Yuriy Fedorov on 13.12.2020.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let avatar: String
    let photos: [String]
}

func generateUser() -> User{
    return User(firstName: Lorem.firstName,
                lastName: Lorem.lastName,
                avatar: String(Int.random(in: 1...5)),
                //photos: (1...5).map {_ in String(Int.random(in: 1...5))})
                photos: ["1"])
}

func generateUsers(count: Int) -> [User] {
    return (1...count).map {_ in generateUser()}
}
