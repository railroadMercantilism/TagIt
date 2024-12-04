import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var tags: [Tag]
    
    @State private var newTagName: String = ""  // State for new tag name input
    @State private var selectedTag: Tag? = nil  // Track selected tag
    @State private var newItemFileName: String = ""  // File name for new item
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                ForEach(tags) { tag in
                    HStack {
                        Text(tag.tagName)
                        Spacer()
                        Button(action: {
                            deleteTag(tag: tag)  // Delete action
                        }) {
                            Image(systemName: "trash")
                        }
                        .buttonStyle(BorderlessButtonStyle())  // Make button work with row selection
                    }
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .onDeleteCommand {
                if let selectedTag = selectedTag {
                    deleteTag(tag: selectedTag)  // Delete selected tag when "Delete" key is pressed
                }
            }
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
                ToolbarItem() {
                    if let selectedTag = selectedTag {
                        Button("Delete Selected Tag") {
                            deleteTag(tag: selectedTag)
                        }
                    }
                }
            }
            
        } detail: {
            if let selectedTag = selectedTag {
                VStack {
                    Text("Items in \(selectedTag.tagName)")
                        .font(.headline)
                    
                    List {
                        ForEach(selectedTag.items) { item in
                            Text("Item: \(item.fileURL ?? "No file")")
                        }
                    }
                    
                    TextField("New Item File Name", text: $newItemFileName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Add Item") {
                        addItemToTag(tag: selectedTag)
                    }
                    .padding()
                    .disabled(newItemFileName.isEmpty)
                }
            } else {
                Text("Select a Tag to view and add items.")
            }
        }
    }
    
    // Function to add a new tag
    private func addTag() {
        guard !newTagName.isEmpty else { return }
        
        withAnimation {
            let newTag = Tag(tagName: newTagName)
            modelContext.insert(newTag)
            newTagName = ""
        }
    }
    
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

    // Save the file to the documents directory
    func saveFileToDocumentsDirectory(fileData: Data, fileName: String) -> URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            try fileData.write(to: fileURL)
            return fileURL
        } catch {
            print("Failed to save file: \(error.localizedDescription)")
            return nil
        }
    }

    // Add an item to the selected tag
    private func addItemToTag(tag: Tag) {
        guard !newItemFileName.isEmpty else { return }
        
        // Create a dummy file to represent the item (you would actually use a real file)
        let dummyData = Data()  // Replace this with actual file data
        if let savedFileURL = saveFileToDocumentsDirectory(fileData: dummyData, fileName: newItemFileName) {
            // Create a new item and associate it with the selected tag
            let newItem = Item(fileURL: savedFileURL.path, tag: tag)
            
            // Insert the new item into the model context
            modelContext.insert(newItem)
            newItemFileName = ""  // Clear the file name input
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Tag.self, inMemory: true)
}
