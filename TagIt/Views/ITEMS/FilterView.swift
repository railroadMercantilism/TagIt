////
////  FilterView.swift
////  TagIt
////
////  Created by Liam Hogan on 12/11/24.
////

import SwiftUI

struct FilterView: View {
    
    @State private var numberOfTags = 4
    
    var body: some View {
        HStack {
            //Text("Filters")
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Menu {
                    ForEach(0..<numberOfTags, id: \.self) { index in
                        Button(action: {
                            print("Filter Option \(index + 1) selected")
                        }, label: {
                            HStack {
                                Text("Example Tag \(index + 1)")
                                Image(systemName: "tag.fill") // Example icon, change as needed
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
