//
//  AddNewView.swift
//  NewMate
//
//  Created by Efe Ertekin on 29.03.2022.
//

import CoreImage
import SwiftUI

struct AddNewView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var peoples: Peoples
    @ObservedObject var lfm: LocalFileManager
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var name = ""
    @State private var description = ""
    @State private var isEmpty = true
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Name", text: $name)
                        .disableAutocorrection(true)
                } header: {
                    Text("Name")
                }
                
                Section{
                    ZStack {
                        Rectangle()
                            .fill(.blue)
                        
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .onTapGesture {
                        showingImagePicker = true
                    }
                } header: {
                    Text("Picture of the person")
                }
                
                Section {
                    TextField("Description", text: $description)
                        .disableAutocorrection(true)
                } header: {
                    Text("Description")
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("NewMate")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of: inputImage) { _ in
                loadImage()
                checkEmpty()
            }
            .onChange(of: name) { _ in checkEmpty() }
            .onChange(of: description) { _ in checkEmpty() }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addPerson()
                    }
                    .disabled(isEmpty)
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func addPerson() {
        let newPeople = People(lfm: self.lfm, name: self.name, description: self.description, itemImage: image)
        //newPeople.itemImage = image
        peoples.items.append(newPeople)
        let result = lfm.saveImage(image: inputImage!, name: newPeople.id.uuidString)
        print(result)
        dismiss()
    }
    
    func checkEmpty() {
        if self.name.trimmingCharacters(in: .whitespacesAndNewlines) != "" && self.description.trimmingCharacters(in: .whitespacesAndNewlines) != "" && self.inputImage != nil {
            self.isEmpty = false
        } else {
            self.isEmpty = true
        }
    }
    
}

struct AddNewView_Previews: PreviewProvider {
    static var peoples = Peoples()
    static var lfm = LocalFileManager()
    
    static var previews: some View {
        AddNewView(peoples: peoples, lfm: lfm)
    }
}
