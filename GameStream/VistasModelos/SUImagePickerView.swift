//
//  SUImagePickerView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Metodo original
        /*if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
        }*/

/*-----------------------------------------------------------*/
        //Modifique nombre contante
   if let UiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
       self.image = Image(uiImage: UiImage)
       
       //Agregue Guardar Imagen en disco:
      
       if let data = UiImage.pngData() {
           // Create URL
           let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
           let url = documents.appendingPathComponent("fotoperfil.png")

           do {
               // Write to Disk
               try data.write(to: url)


           } catch {
               print("No Pude Guardar fotografia en el folder del dispositivo(\(error))")
           }
       }
   }
/*-----------------------------------------------------------*/
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}

