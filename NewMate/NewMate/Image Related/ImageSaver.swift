//
//  ImageSaver.swift
//  NewMate
//
//  Created by Efe Ertekin on 29.03.2022.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeToFolder(image: UIImage, rootName: String) {
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("\(rootName)")
            try? jpegData.write(to: filename)
        }
        
    }

    @objc func saveComplete(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
