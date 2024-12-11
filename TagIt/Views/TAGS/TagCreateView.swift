//
//  TagCreateView.swift
//  TagIt
//
//  Created by Liam Hogan on 12/10/24.
//
///This View creates the UI that users will interact with to create a new tag

import SwiftUI

struct TagCreateView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var tagName: String = ""
    @FocusState private var tagNameFocus: Bool
    @State private var modelData = ModelData()
    
    @State var selectedIcon = "tag.fill"
    @State private var selectedColor: Color = .white
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text("Create New Tag:")
                .font(.headline)
                .fontWeight(.bold)
            
            HStack {
                TextField(
                    "Tag Name",
                    text: $tagName
                )
                .focused($tagNameFocus)
                .onSubmit {
                    //if we need name check validation, that should go here
                    print("tag name: \(tagName)")
                }
                .textFieldStyle(.roundedBorder)
                
                Menu {
                    ForEach(modelData.tagIcons, id: \.self) { tagIcon in
                        Button(action: {
                            selectedIcon = tagIcon.symbol
                        }, label: {
                            Image(systemName: tagIcon.symbol)
                                .foregroundStyle(selectedColor)
                                .fontWeight(.bold)
                        })
                    }
                } label: {
                    Label(
                        title: {Text("")},
                        icon: {
                            Image(systemName: selectedIcon)
                                .foregroundStyle(selectedColor)
                        })
                }
                .font(.largeTitle)
                .frame(width: 55)
                
                ColorPicker("", selection: $selectedColor)
                
                
            }
            
            HStack {
                Spacer()
                
                Button (
                    action: { dismiss()},
                    label: { Text("Cancel") }
                )
                
                Button (
                    action: {
                        //temporary
                        print("tag created with name: \(tagName), icon: \(selectedIcon), and color: \(selectedColor)")
                    },
                    label: { Text("Create Tag") }
                )
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.all, 15)
        .frame(minWidth: 200, maxWidth: 450, minHeight: 100, maxHeight: 150)
    }
}

#Preview {
    TagCreateView()
}
