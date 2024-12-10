//
//  TagListItem.swift
//  TagIt
//
//  Created by Liam Hogan on 12/9/24.
//

import SwiftUI

//This will eventually be superseded by the Tag() class once it is working
struct TempTag {
    let name: String
    let color: Color
    let icon: String
}

struct TagListItem: View {
    
    //snippet below temporary, will need to instead pull data from Tag()
    var tag = TempTag(name: "Example Tag", color: .blue, icon: "tag.fill")
    
    var body: some View {
        HStack {
            Image(systemName: tag.icon)
                .foregroundStyle(tag.color)
                .fontWeight(.bold)
            
            Text(tag.name)
                .font(.title3)
            
            Spacer()
        }
        .frame(minWidth: 100)
    }
}

#Preview {
    TagListItem()
}
