import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var tags: [Tag]
    
    @State private var newTagName: String = ""
    
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
                ToolbarItem {
                    TextField("Prospective Tag Name", text: $newTagName)  
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }
        } detail: {
            Text("Select a Tag")
        }
    }
    
    // Function to add a new tag
    private func addTag() {
        guard !newTagName.isEmpty else { return }
        withAnimation {
            let newTag = Tag(tagName: newTagName)
            
            // Insert the new tag into the model context
            modelContext.insert(newTag)
            
            // Clear the input field after adding
            newTagName = ""
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
        .modelContainer(for: Tag.self, inMemory: true)
}
