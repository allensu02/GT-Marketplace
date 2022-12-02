//
//  ImagePicker2.swift
//  GT Marketplace
//
//  Created by Rachel Y on 11/15/22.
//

import SwiftUI
import UIKit

struct ImagePicker2: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
     
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker2>) ->
    UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_  uiViewController: UIImagePickerController, context: Context) {
        //wdwqdwq
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
           var parent: ImagePicker2
        
           init(_ parent: ImagePicker2) {
               self.parent = parent
           }
           
       
           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   parent.selectedImage = image
               }
        
               parent.presentationMode.wrappedValue.dismiss()
           }
       }
       
       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
}


