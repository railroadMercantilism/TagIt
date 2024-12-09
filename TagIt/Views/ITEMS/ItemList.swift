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

    var body: some View {
        NavigationSplitView {

        } detail: {
            Text("Drag files and folders to add")
        }
    }
}

#Preview {
    ItemList()
        //.environment(ModelData())
}