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
                        Text("Tag of \(tag.tagName)")
                    } label: {
                        Text("Tag of \(tag.tagName)")
                    }
                }
                .onDelete(perform: deleteTag)
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: addTag) {
                        Label("Add Tag", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a Tag")
        }
    }
    
    // Function to add a new tag
    private func addTag() {
        withAnimation {
            let name = input()  // Assuming this function gets a string input correctly
            
            // Empty arrays for child and parent tags, or use actual selections
            let selectedChildTags: [String] = []
            let selectedParentTags: [String] = []
            
            // Assuming Tag has an initializer that accepts these parameters
            let newTag = Tag(tagName: name, children: selectedChildTags, parents: selectedParentTags)
            
            modelContext.insert(newTag)
        }
    }
    
    // Function to delete a tag
    private func deleteTag(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tags[index])
            }
        }
    }
    
    // Function to handle user input
    private func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        
        return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
