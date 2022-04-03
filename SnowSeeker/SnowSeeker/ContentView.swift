//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Efe Ertekin on 2.04.2022.
//

import SwiftUI


extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    
    @State private var searchText = ""
    
    enum sortings {
        case defaultOrder, countryOrder, alphabeticalOrder
    }
    
    @State private var sortingMethod = sortings.defaultOrder
    @State private var showingSorting = false
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack{
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSorting = true
                    } label: {
                        Label("Sorts", systemImage: "list.dash")
                    }
                }
            }
            .confirmationDialog("Change Order", isPresented: $showingSorting) {
                Button("Default") {
                    sortingMethod = .defaultOrder
                }
                Button("Country") {
                    sortingMethod = .countryOrder
                }
                Button("Alphabetical") {
                    sortingMethod = .alphabeticalOrder
                }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
        //.phoneOnlyStackNavigationView()
    }
    
    var filteredResorts: [Resort] {
        var sortResorts = resorts
        
        if sortingMethod == .countryOrder {
            sortResorts.sort { $0.country < $1.country }
        } else if sortingMethod == .alphabeticalOrder {
            sortResorts.sort { $0.name < $1.name }
        } else {
            sortResorts = resorts
        }
        
        
        if searchText.isEmpty {
            return sortResorts
        } else {
            return sortResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
