//
//  TagListItem.swift
//  TagIt
//
//  Created by Liam Hogan on 12/9/24.
//

import SwiftUI

struct TagListItem: View {
    var body: some View {
        HStack {
            Image(systemName: "tag")
            
            Text("Example Tag")
                .font(.title3)
            
            Spacer()
        }
        .frame(minWidth: 100)
    }
}

#Preview {
    TagListItem()
}
