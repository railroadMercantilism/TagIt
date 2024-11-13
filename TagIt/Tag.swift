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
    var name: String
    var children: [String]
    var parents: [String]
    var population: [String]
    
    
    init(name: String, children: [String], parents: [String]) {
        self.name = name;
        self.children = children;
        self.parents = parents;
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


/**
 @Model
 final class Tag {
 var name: String;
 var children:[String];
 var parent:[String];
 
 init(name: String) {
 self.name = name
 children = []
 parent = []
 }
 
 func setParent (tempParent: String) {
 
 }
 
 func setChild (tempChild: String) {
 
 }
 
 }
 */
