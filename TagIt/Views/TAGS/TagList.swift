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
            Text("Tags")
            .frame(minWidth: 200, minHeight: 100, idealHeight: 600, maxHeight: .infinity)
    }
}

#Preview {
    TagList()
        //.environment(ModelData())
}

