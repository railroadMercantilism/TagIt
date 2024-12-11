//
//  ItemList.swift
//  TagIt
//
//  Created by James Barry on 12/8/24.
//

//TODO: Adapt this to work with ItemList instead of LandmarkList;  Adapt this to work with SwiftData instead of through JSON (Should be similar to TagList, except that ItemList will be completely dependent on which Tags are selected)
import SwiftUI
import SwiftData

struct ItemList: View {
    @Query private var items: [Item]
    
    var sampleItems = [
        Item(fileURL: "https://www.infogrepper.com/wp-content/uploads/2022/10/image-url-for-testing.png"),
        Item(fileURL: "/Users/jamesbarry/Documents/Personal/Independent Writing/annotated-Aesthetics essay.docx.pdf"),
        Item(fileURL: "/Users/jamesbarry/Documents/P4C/Poems Lesson Plan/Giving-Tree-1415722253.jpg")
    ]
    
    var body: some View {
        VStack {
            ForEach(sampleItems) { item in
                ItemListItem(item: item)
            }
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
    }
}

#Preview {
    ItemList()
        //.environment(ModelData())
}
