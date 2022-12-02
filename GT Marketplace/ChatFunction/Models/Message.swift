//
//  Message.swift
//  GT Marketplace
//
//  Created by Max Ko on 11/8/22.
//

import Foundation

struct Message: Identifiable, Hashable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
    
    
}
