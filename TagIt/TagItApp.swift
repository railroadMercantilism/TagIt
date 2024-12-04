//
//  TagItApp.swift
//  TagIt
//
//  Created by James Barry on 9/18/24.
//

import SwiftUI
import SwiftData

@main
struct TagItApp: App {
    
    //Inital Setup: Creating the folder and the linked list
    //Every-other-time: reloading previous linked list
    init() {
        startUp()
    }
    
    func startUp() {
        let folderName = ".TagIt" // Change this to your desired folder name
        let fileManager = FileManager.default

            
        // Get the documents directory path
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Could not find the documents directory.")
            return
        }
            
        // Create the full folder URL
        let folderURL = documentsDirectory.appendingPathComponent(folderName)

        // Check if the folder exists
        if fileManager.fileExists(atPath: folderURL.path) {
            print("Folder already exists at: \(folderURL.path)")
        } else {
            do {
                // Create the folder
                try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
                print("Folder created at: \(folderURL.path)")
            } catch {
                print("Error creating folder: \(error.localizedDescription)")
            }
        }
        
    }

    var sharedModelContainer: ModelContainer = {
        
        let schema = Schema([
            Item.self,
            Tag.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        let urlApp = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).last
               let url = urlApp!.appendingPathComponent("default.store")
               if FileManager.default.fileExists(atPath: url.path) {
                   print("swiftdata db at \(url.absoluteString)")
        }

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
            
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
