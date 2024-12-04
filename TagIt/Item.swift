//
//  Item.swift
//  TagIt
//
//  Created by James Barry on 12/3/24.
//

import AppKit
import Foundation
import SwiftData

@Model
final class Item {
    @Attribute(.unique) var id: UUID
    var tags: [Tag]
    var fileURL: String?
    
    init(fileURL: String) {
        self.id = UUID()
        self.fileURL = fileURL
        self.tags = []
    }
    
    var fileURLObject: URL? {
            guard let fileURL = fileURL else { return nil }
            return URL(fileURLWithPath: fileURL)
    }
    
}
