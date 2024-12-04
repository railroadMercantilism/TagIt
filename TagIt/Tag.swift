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
    var children: [String]
    var parents: [String]
    var population: [String]
    
    
    init(tagName: String, children: [String], parents: [String]) {
        self.tagName = tagName;
        self.children = children;
        self.parents = parents;
        self.population = []
    }
    
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
}



