//
//  ProfilesViews.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 22/02/24.
//

import SwiftUI

struct ProfilesViews: View {
    var profiles = Profile.allCases
    
    var body: some View {
        NavigationStack() {
            VStack {
                // MARK: Title
                HStack {
                    Text("Who want to watch Netflix?")
                    Button("Modify") { }
                        .buttonStyle(.borderless)
                }.font(.title3)
                
                Spacer()
                
                // MARK: Profile Grid
                LazyHGrid(
                    rows: [GridItem(.fixed(150)), GridItem(.fixed(150))]
                ) {
                    ForEach(0..<profiles.count - 1, id: \.self) { index in
                        ProfileButton(profile: profiles[index])
                    }
                }.padding(8)
                
                ProfileButton(profile: .sophie)
                
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    ProfilesViews()
}
