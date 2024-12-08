//
//  TagCommands.swift
//  TagIt
//
//  Created by James Barry on 12/8/24.
//

// We are going to have to change this so we can select multiple tags at once. We are going to need to change it into a array.
//TODO: add documentation and change to array representation
import SwiftUI

struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedTag) var selectedTag

    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Tag") {
        }
    }
}

private struct SelectedTagKey: FocusedValueKey {
    typealias Value = Binding<Tag>
}

extension FocusedValues {
    var selectedTag: Binding<Tag>? {
        get { self[SelectedTagKey.self] }
        set { self[SelectedTagKey.self] = newValue }
    }
    
//TODO: Maybe this is where possible deletion actions should happen
/*
 // Function to add a new tag
 private func addTag() {
     guard !newTagName.isEmpty else { return }
     
     withAnimation {
         let newTag = Tag(tagName: newTagName)
         modelContext.insert(newTag)
         newTagName = ""
     }
 }
 */
 /*
 // Function to delete a tag (by item or by index)
 @MainActor
 private func deleteTag(tag: Tag? = nil, offsets: IndexSet? = nil) {
     withAnimation {
         if let tag = tag {
             modelContext.delete(tag)
         } else if let offsets = offsets {
             for index in offsets {
                 let tagToDelete = tags[index]
                 modelContext.delete(tagToDelete)
             }
         }
     }
 }
 */
}
