//
//  Item.swift
//  TagIt
//
//  Created by James Barry on 12/3/24.
//

import AppKit
import Foundation
import SwiftData

/*
 Because of @Model; This is the Item TABLE. Image each of these variables as a columns in a table in a database.
 */
@Model
final class Item {
    
    // These are the 'columns' in the table, alongside their types. {
    
    // @Attribute(.unique) means each UUID is unique
    @Attribute(.unique) var id: UUID
    
    var tags: [Tag]
    var fileURL: String?
    // }
    
    // INITALIZE EACH ITEM {
    init(fileURL: String) {
        self.id = UUID()
        self.fileURL = fileURL
        self.tags = []
    }
    // }
    
    
    /*
     Possible future implementation: show the fileURL as a URL object and then show file details/preview in the app.
     */
    
    func addTag(tag: Tag) {
        tags.append(tag)
    }
}
