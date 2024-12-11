//
//  TagList.swift
//  TagIt
//
//  Created by James Barry on 12/8/24.
//

//TODO: Adapt this to work with TagList instead of LandmarkList;  Adapt this to work with SwiftData instead of through JSON
import SwiftUI
import SwiftData

struct TagList: View {
    @Query private var tags: [Tag]
    @State private var showTagCreateView = false
    
//    var tagList: [Tag] = [
//        Tag(tagName: "Work", tagIcon: "briefcase.fill"),
//        Tag(tagName: "Personal", tagIcon: "person.fill"),
//        Tag(tagName: "School", tagIcon: "graduationcap.fill"),
//    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("TagIt")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)
                
                ForEach (tags) { tag in
                    TagListItem(tag: tag)
                }
                
                Spacer()
            }
            .padding(.leading, 20)
            .frame(minWidth: 200, minHeight: 100, maxHeight: .infinity)
            .toolbar {
                ToolbarItem() {
                    Button(action: {
                        showTagCreateView = true
                    }) {
                        Label("New Tag", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showTagCreateView) {
                TagCreateView()
            }
        }
    }
}

#Preview {
    //TagList()
}

