//
//  ContentView.swift
//  TagIt
//
//  Created by James Barry on 9/18/24.

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tags: [Tag]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(tags) { tag in
                    NavigationLink {
                        Text("Tag of \(tag.name))")
                    } label: {
                        Text("Tag of \(tag.name))")
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    /*
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                    */
                    Button(action: addTag) {
                        Label("Add Tag", systemImage: "plus")
                    }

                }
            }
        } detail: {
            Text("Select a Tag")
        }
    
    
    
    private func addItem() {
        withAnimation {
            var selectedContainerTags: [String]

            ForEach(tags, id: \.self) {
                Text($0)
            }
            
            let newItem = Item(name: name)
            modelContext.insert(newItem)
        }
    }
    
    
    private func addTag() {
        withAnimation{
            var selectedChildTags: [String]
            var selectedParentTags: [String]
            
            let name = input()
            ForEach(tags, id: \.self) {
                Text($0)
            }
            ForEach(tags, id: \.self) {
                Text($0)
            }
                    
            let newTag = Tag(name: name, selectedChildTags, selectedParentTags)
            modelContext.insert(newTag)
                
            }
        }
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tags[index])
            }
        }
    }
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData

        return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

