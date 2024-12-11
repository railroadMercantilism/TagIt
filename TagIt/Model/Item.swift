//
//  Item.swift
//  TagIt
//
//  Created by James Barry on 12/3/24.
//

import AppKit
import Foundation
import SwiftData
import SwiftUICore

/*
 Because of @Model; This is the Item TABLE. Image each of these variables as a columns in a table in a database.
 */
@Model
final class Item {
    
    // @Attribute(.unique) means each UUID is unique
    @Attribute(.unique) var id: UUID
    
    var itemName: String
    var tags: [Tag]
    var fileURL: String?

    
    init(fileURL: String) {
        self.id = UUID()
        self.fileURL = fileURL
        self.itemName = ""
        self.tags = []
    }
    
    func convertToURL(fileURL: String) -> URL? {
        return URL(fileURLWithPath: fileURL)
    }
    
    /*
     Possible future implementation: show the fileURL as a URL object and then show file details/preview in the app.
    */
    func addTag(tag: Tag) {
        tags.append(tag)
    }
    
    var image: Image? {
        guard let filePath = fileURL else {
            print("fileURL is nil")
            return nil
        }
        
        print("Looking for file at: \(filePath)")
        
        // Check if file exists at the given file path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            if let nsImage = NSImage(contentsOfFile: filePath) {
                print("Image found, width: \(Int(nsImage.size.width))")
                return Image(nsImage: nsImage)
            }
        }
        print("File not found at path: \(filePath)")
        return nil
    }
}
