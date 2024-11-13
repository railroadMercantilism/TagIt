//
//  Item.swift
//  TagIt
//
//  Created by James Barry on 9/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var tags: [String]
    
    init(name: String, tags: [String]) {
        self.name = name
        self.tags = tags
    }
}
