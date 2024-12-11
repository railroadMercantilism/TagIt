//
//  Tag.swift
//  TagIt
//
//  Created by James Barry on 11/13/24.
//
import Foundation
import SwiftData
import SwiftUI


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
    
    var tagColor: String
    
    var tagIcon: String
    
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
    init(tagName: String, tagColor: String, tagIcon: String) {
        self.id = UUID()
        self.tagName = tagName
        self.tagColor = tagColor
        self.tagIcon = tagIcon
        self.children = []
        self.parents = []
        self.population = []
    }
    // }
    
    // ADD A CHILD TAG {
    func addChildTag(tag: Tag) {
        children?.append(tag)
    }
    // }
    
    // ADD A PARENT TAG {
    func addParentTag(tag: Tag) {
        parents?.append(tag)
    }
    // }
    
    // Change the color of the tag
    func changeColor(color: String) {
        self.tagColor = color
    }
    
    func changeIcon(icon: String) {
        self.tagIcon = icon
    }
    
    func changeColor(color: Color) {
        self.tagColor = colorToHex(color)
    }
    
    func colorToHex(_ color: Color) -> String {
        guard let components: [CGFloat] = color.cgColor?.components else { return "#FFFFFFFF" }
        
        if(components.count == 2) {
            return String(format: "#%02lX%02lX%02lX", lroundf(Float(components[0]) * 255.0), lroundf(Float(components[0]) * 255.0), lroundf(Float(components[0]) * 255.0))
        }
        return String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(components[0]) * 255.0), lroundf(Float(components[1]) * 255.0), lroundf(Float(components[2]) * 255.0), lroundf(Float(components[3]) * 255.0))
    }
}

extension Color {
    public init(fromHex: String) {


        let _colorSpace: Color.RGBColorSpace = .sRGB
        let r, g, b: CGFloat
        let start = fromHex.index(fromHex.startIndex, offsetBy: 1)
        let hexColor = String(fromHex[start...])

        if(hexColor.count == 6) {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if(scanner.scanHexInt64(&hexNumber)) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                
                self.init(_colorSpace, red: r, green: g, blue: b)
                return
            }
        }
        self.init(_colorSpace, red: 256, green: 256, blue: 256)
    }
}

