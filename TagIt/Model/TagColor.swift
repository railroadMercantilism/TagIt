//
//  TagColor.swift
//  TagIt
//
//  Created by James Barry on 12/10/24.
//

@propertyWrapper
struct TagColor {
    private var backingData: String  // Storing as a String, e.g., hex color
    
    init(wrappedValue: String) {
        self.backingData = wrappedValue
    }

    var wrappedValue: String {
        get {
            return backingData
        }
        set {
            backingData = newValue
        }
    }
}
