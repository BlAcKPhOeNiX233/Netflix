//
//  ProfileButton.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 22/02/24.
//

import SwiftUI

struct ProfileButton: View {
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var profile: Profile
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(profile.rawValue)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Text(profile.rawValue)
            }
        }
        .buttonStyle(.borderless)
    }
    
    private var destination: some View {
        return TabView {
            HomeView(profileName: "Bryan")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            HomeView(profileName: "Bryan")
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            HomeView(profileName: "Bryan")
                .tabItem {
                    Label("My Netflix", systemImage: "person.crop.circle")
                }
            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .tabItem {
                    Label("Immersive Space", systemImage: "mountain.2")
                }
            .onChange(of: showImmersiveSpace) { _, newValue in
                Task {
                    if newValue {
                        switch await openImmersiveSpace(id: "ImmersiveSpace") {
                        case .opened:
                            immersiveSpaceIsShown = true
                        case .error, .userCancelled:
                            fallthrough
                        @unknown default:
                            immersiveSpaceIsShown = false
                            showImmersiveSpace = false
                        }
                    } else if immersiveSpaceIsShown {
                        await dismissImmersiveSpace()
                        immersiveSpaceIsShown = false
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileButton(profile: Profile.bryan)
}
