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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
