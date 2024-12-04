//
//  Tag.swift
//  TagIt
//
//  Created by James Barry on 11/13/24.
//

import Foundation
import SwiftData

@Model
final class Tag {
    @Attribute(.unique) var id: UUID
    var tagName: String
    var children: [Tag]
    var parents: [Tag]
    @Relationship(inverse: \Item.tags) var population: [Item]
    
    init(tagName: String) {
        self.id = UUID()
        self.tagName = tagName
        self.children = []
        self.parents = []
        self.population = []
    }
}



/*
//
//  Tag.swift
//  TagIt
//
//  Created by James Barry on 11/13/24.
//

import Foundation
import SwiftData

@Model
final class Tag {
    var tagName: String
    /*
    var children: [String]
    var parents: [String]
    var population: [String]
     */

    init(tagName: String /*, children: [String], parents: [String]*/) {
        self.tagName = tagName
        /*
        self.children = children
        self.parents = parents
        self.population = []  // Initialize population with an empty array
         */
    }


    /*
    func setParent (tempParent: String) {
        parents.append(tempParent)
    }
    
    func setChild (tempChild: String) {
        children.append(tempChild)
    
    }
    
    func addCitizen(Citizen: String) {
        population.append(Citizen)
    }
    
    func checkPopulation() -> [String] {
        return population;
    }
     */
}

*/

