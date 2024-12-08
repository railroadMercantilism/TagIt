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
        NavigationSplitView {

        } detail: {
            Text("Tag(s)")
        }
    }
}

#Preview {
    TagList()
        //.environment(ModelData())
}

