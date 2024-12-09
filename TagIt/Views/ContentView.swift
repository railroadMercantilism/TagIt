import SwiftUI
import SwiftData

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            TagList()
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: {
                            print("Left plus button clicked")
                        }) {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
        } detail: {
            Text("Files")
        }
        .frame(minWidth: 700, minHeight: 300)
        .toolbar {
            ToolbarItemGroup(placement: .confirmationAction) {
                Button(action: {
                    print("Add button clicked")
                }) {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

