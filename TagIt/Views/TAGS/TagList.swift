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

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("TagIt")
                .font(.largeTitle)
                .bold()
            
            TagListItem()
            
            Spacer()
        }
        .padding(.leading, 20)
        .frame(minWidth: 200, minHeight: 100, idealHeight: 600, maxHeight: .infinity)
        .toolbar {
            ToolbarItem() {
                Button(action: {
                    print("Add button clicked")
                }) {
                    Label("New Tag", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    TagList()
        //.environment(ModelData())
}

