////
////  FilterView.swift
////  TagIt
////
////  Created by Liam Hogan on 12/11/24.
////

import SwiftUI
import SwiftData

struct FilterView: View {
    @Query private var tags: [Tag]
    
    var body: some View {
        HStack {
            //Text("Filters")
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Menu {
                    ForEach(tags) { tag in
                        Button(action: {
                            print(tag.tagName + " filter selected")
                        }, label: {
                            HStack {
                                Text(tag.tagName)
                                Image(systemName: tag.tagIcon)
                                    .foregroundStyle(.red)
                                    .fontWeight(.bold)
                            }
                        })
                    }
                } label: {
                    Label("Add Filter", systemImage: "line.3.horizontal.decrease")
                }
            }
        }
    }
}

#Preview {
    FilterView()
}
