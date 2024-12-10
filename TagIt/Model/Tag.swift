//
//  Tag.swift
//  TagIt
//
//  Created by James Barry on 11/13/24.
//
import Foundation
import SwiftData

/*
 Because of @Model; This is the Tag TABLE. Image each of these variables as a columns in a table in a database.
 */
@Model
final class Tag {
    // These are the 'columns' in the table, alongside their types. {
    
    // @Attribute(.unique) means each UUID is unique
    @Attribute(.unique) var id: UUID
    
    // This is the name of the tag
    var tagName: String
    
    // List of Parent Tags
    public var parents: [Tag]?
    
    // @Relationship(inverse: \Tag.tags) means that, for each Tag added into Tag.parents, the Tag will also add the childTag.parent array.
    // DeleteRule is .cascade, which means that if a parent is deleted, all children are also deleted.
    @Relationship(deleteRule:.cascade, inverse: \Tag.parents) var children: [Tag]?
    
    // @Relationship(inverse: \Item.tags) means that, for each Item added into Tag.population, the Item will also add the Item to its Item.tags array.
    // DeleteRule is .cascade, which means that if a tag is deleted, all items are also deleted.
    @Relationship(deleteRule:.cascade, inverse: \Item.tags) var population: [Item]
    
    // }
    
    // INITALIZE EACH TAG {
    init(tagName: String) {
        self.id = UUID()
        self.tagName = tagName
        //self.color
        //self.icon
        self.children = []
        self.parents = []
        self.population = []
    }
    // }
}

