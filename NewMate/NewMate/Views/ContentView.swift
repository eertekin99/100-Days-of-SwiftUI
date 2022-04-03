//
//  ContentView.swift
//  NewMate
//
//  Created by Efe Ertekin on 29.03.2022.
//

import CoreImage
import SwiftUI

struct ContentView: View {
    @State private var showingAdd = false
    @StateObject private var peoples = Peoples()
    @StateObject private var lfm = LocalFileManager()
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(peoples.items, id: \.id) { item in
                    NavigationLink {
                        Text(item.name)
                        Text(item.description)
                        item.itemImage?
                            .resizable()
                            .frame(width: 150, height: 100, alignment: .trailing)
                            .clipShape(Capsule())
                    } label: {
                        HStack {
                            VStack {
                                Text(item.name)
                                Text(item.description)
                            }
                            
                            Spacer()
                            
                            item.itemImage?
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .trailing)
                                .clipShape(Capsule())
                        }
                        
                    }
//                    .task {
//                        let outputImage = lfm.getImage(name: item.name)
//                        item.itemImage = Image(uiImage: outputImage!)
//                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("NewMate")
            .sheet(isPresented: $showingAdd) {
                AddNewView(peoples: peoples, lfm: lfm)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAdd.toggle()
                    } label: {
                        Label("Add Mate", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        peoples.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
