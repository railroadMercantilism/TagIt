//
//  ModelData.swift
//  TagIt
//
//  Created by James Barry on 12/8/24.
//

import Foundation
import SwiftData

@Observable
class ModelData {
    //var Tags: [Tag] = load("TagData.json")
    //var Items: [Item] = load("ItemData.json")
    var tagIcons: [TagIcon] = load("tagIcons.json")
}


/**
 Loads data stored in JSON files
 Loads a JSON file from the main bundle and decodes it into a generic type
    
    - Parameter filename: The name of the file to load
    - Returns: The decoded data
*/
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

/**
 Stores Tags and Items in JSON files so I don't have to deal with Swift Persistence
 By Storing a generic in the data in the main bundle
 
    - Parameter object: The object to store
    - Parameter filename: The name of the file to store the object in
 */
func store<T: Encodable>(_ object: T, to filename: String) {
    let encoder = JSONEncoder()

    do {
        let data = try encoder.encode(object)
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        try data.write(to: fileURL)
    } catch {
        fatalError("Couldn't save \(filename) to main bundle:\n\(error)")
    }
}
