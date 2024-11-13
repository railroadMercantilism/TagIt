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
    @Query private var items: [Item]
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
            Text("Select an item")
        }
    }
    
    /*
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    */
    
    private func addTag() {
        withAnimation{
            print("Please enter your name:")

            let name = input()

            print("\(name)")
            let newTag = Tag(name: name)
            modelContext.insert(newTag)
        }
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
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
