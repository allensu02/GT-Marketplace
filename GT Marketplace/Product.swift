//
//  Product.swift
//  GT Marketplace
//
//  Created by Dubem Nwizubo on 10/4/22.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    
}

var productList = [Product(name: "Couch", image: "couch1", description: "Fairly used couch")]
