import SwiftUI
import SwiftData

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            TagList()
        } detail: {
            ItemList()
            //Text("Files")
        }
        .frame(minWidth: 700, minHeight: 300)
        .toolbar {
//            ToolbarItem(placement: .navigation) {
//                Text("Tag Filters:")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//            }
            FilterView()
        }
        .navigationTitle("")
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

