//
//  NetflixApp.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 22/02/24.
//

import SwiftUI

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
