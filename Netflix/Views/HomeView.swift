//
//  HomeView.swift
//  Netflix
//
//  Created by Bryan Sánchez Peralta on 23/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var picker = -1
    @State private var tvSeriesIsOn = false
    @State private var filmsIsOn = false
    @State private var selectedContentType: ContentType?
    @State private var selectedCategory: Category?
    
    let profileName: String
    
    var body: some View {
        ScrollView {
            // MARK: Title
            HStack {
                Text("For \(profileName)")
                Spacer()
                Button() {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                }.buttonStyle(.borderless)
            }.font(.title)
            
            // MARK: Filters
            HStack {
                if tvSeriesIsOn == true || filmsIsOn == true || selectedCategory != nil {
                    Button() {
                        tvSeriesIsOn = false
                        filmsIsOn = false
                        selectedContentType = nil
                        selectedCategory = nil
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
                
                Toggle("TV Series", isOn: $tvSeriesIsOn)
                    .onChange(of: tvSeriesIsOn) {
                        if tvSeriesIsOn {
                            filmsIsOn = false
                            selectedContentType = .tvSerie
                        } else if !filmsIsOn {
                            selectedContentType = nil
                        }
                    }
                    .toggleStyle(.button)
                Toggle("Films", isOn: $filmsIsOn)
                    .onChange(of: filmsIsOn) {
                        if filmsIsOn {
                            tvSeriesIsOn = false
                            selectedContentType = .film
                        } else if !tvSeriesIsOn {
                            selectedContentType = nil
                        }
                    }
                    .toggleStyle(.button)
                Menu() {
                    ForEach(Category.allCases) { category in
                        Button(category.rawValue) {
                            selectedCategory = category
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedCategory?.rawValue ?? "Categories")
                        Image(systemName: "chevron.down")
                    }
                }.menuOrder(.fixed)
            }
            
            // MARK: List
            ForEach(Category.allCases) { category in
                if isEmpty(category: category) {
                    VStack(alignment: .leading) {
                        Text(category.rawValue).font(.title2)
                        ScrollView(.horizontal) {
                            LazyHStack() {
                                ForEach(
                                    Content.allCases.filter({ $0.categories.contains(category)
                                    })
                                ) { content in
                                    if selectedContentType == nil || content.type == selectedContentType {
                                        ContentButton(content: content)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal)
        .padding(.top)
    }
    
    private func isEmpty(category: Category) -> Bool {
        for content in Content.allCases {
            if content.categories.contains(category) {
                return true
            }
        }
        
        return false
    }
}

#Preview {
    HomeView(profileName: Profile.bryan.rawValue)
}
