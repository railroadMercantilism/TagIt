//
//  TagInitPanel.swift
//  TagIt
//
//  Created by James Barry on 12/10/24.
//
/*
import SwiftUI
import SwiftData


struct TagInitPanel: View {
    // State to store the tag name input
    @State private var tagName: String = ""
    @State private var tag: Tag?
    @Query private var tags: [Tag]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("TagIt")
                .font(.largeTitle)
                .bold()
            
            // TextField for user input of tag name
            TextField("Enter tag name", text: $tagName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                // Initialize the Tag when the user presses the button
                if !tagName.isEmpty {
                    tag = Tag(tagName: tagName)
                }
            }) {
                Text("Create Tag")
                    .fontWeight(.bold)
                    .padding()
                    .background(tagName.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(tagName.isEmpty)
            
            // Optionally show the created tag's name
            if let tag = tag {
                Text("Created Tag: \(tag.tagName)")
                    .padding(.top, 20)
            }
        }
        .padding()
    }
}

#Preview {
    TagInitPanel()
}
*/
