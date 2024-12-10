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
    //@Query private var tags: [Tag]
    
    //This is a temporary String with dummy data
    @State private var numberOfTags = 2

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text("TagIt")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 10)
                
                //Given range will need to be total number of tags
                ForEach(0..<numberOfTags, id: \.self) { _ in
                    label: do {
                        TagListItem()
                    }
                }
                
                Spacer()
            }
            .padding(.leading, 20)
            .frame(minWidth: 200, minHeight: 100, maxHeight: .infinity)
            .toolbar {
                ToolbarItem() {
                    Button(action: {
                        numberOfTags += 1
                    }) {
                        Label("New Tag", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TagList()
        //.environment(ModelData())
}

