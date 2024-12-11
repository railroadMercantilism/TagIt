//
//  TagListItem.swift
//  TagIt
//
//  Created by Liam Hogan on 12/9/24.
//

import SwiftUI
import SwiftData

//This will eventually be superseded by the Tag() class once it is working
struct TempTag {
    let name: String
    let color: String
    let icon: String
    
}

struct TagListItem: View {
    var tag: Tag
    
    var body: some View {
        HStack {
            Image(systemName: tag.tagIcon)
                .foregroundStyle(Color(fromHex: tag.tagColor))
                .fontWeight(.bold)
            
            Text(tag.tagName)
                .font(.title3)
            
            Spacer()
        }
        .frame(minWidth: 100)
    }
}

#Preview {

}
