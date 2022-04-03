//
//  People.swift
//  NewMate
//
//  Created by Efe Ertekin on 29.03.2022.
//

import CoreImage
import SwiftUI
import Foundation

struct People: Identifiable {
    @ObservedObject var lfm: LocalFileManager
    
    var id = UUID()
    var name: String
    var description: String
    var itemImage: Image?
//        get {
//            if lfm.getImage(name: self.name) != nil {
//                let outputImage = lfm.getImage(name: self.name)
//                let image = Image(uiImage: outputImage!)
//                return image
//            } else {
//                return nil
//            }
//        }
    
}
