//
//  TagListItem.swift
//  TagIt
//
//  Created by Liam Hogan on 12/9/24.
//
import SwiftUI
import SwiftData


struct ItemListItem: View {
    var item: Item
    
    var body: some View {
        VStack {
            if let image = item.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
            } else {
                Text("No Image Available")
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
        
}
