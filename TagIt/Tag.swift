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
    
    
    init(name: String) {
        self.name = name;
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
