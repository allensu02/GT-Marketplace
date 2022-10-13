//
//  Item.swift
//  GT Marketplace
//
//  Created by Shreya Malpani on 10/4/22.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var picture: String
    var likes: Int
    var comments: Int
    var isFavorited: Bool
    
    
    mutating func toggleFavorite() {
        if (!isFavorited) {
            likes = likes + 1
        } else {
            likes = likes - 1
        }
        
        isFavorited = !isFavorited
    }

}
