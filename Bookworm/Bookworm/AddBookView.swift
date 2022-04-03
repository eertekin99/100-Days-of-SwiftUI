//
//  AddBookView.swift
//  Bookworm
//
//  Created by Efe Ertekin on 18.03.2022.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3
    
    @State private var hasValidValues = false
    @State private var showingAlert = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                        .disableAutocorrection(true)
                    TextField("Author:", text: $author)
                        .disableAutocorrection(true)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                        .disableAutocorrection(true)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        testEmpty()
                        
                        if hasValidValues == true {
                            let newBook = Book(context: moc)
                            newBook.id = UUID()
                            newBook.date = Date.now
                            newBook.title = title
                            newBook.author = author
                            newBook.rating = Int16(rating)
                            newBook.genre = genre
                            newBook.review = review
                            try? moc.save()
                            dismiss()
                            
                        } else {
                            showingAlert = true
                        }
                    }
                }
                .alert("Missing Parts", isPresented: $showingAlert) {
                    Button("OK") {}
                }
                
            }
            .navigationTitle("Add Book")
        }
    }
    
    func testEmpty() {
        if (title.trimmingCharacters(in: .whitespaces).isEmpty || author.trimmingCharacters(in: .whitespaces).isEmpty || genre.trimmingCharacters(in: .whitespaces).isEmpty) {
            
            hasValidValues = false
        
        } else {
            hasValidValues = true
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
