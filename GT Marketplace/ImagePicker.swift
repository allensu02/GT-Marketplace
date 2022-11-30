//
//  ImagePicker.swift
//  GT Marketplace
//
//  Created by Eric Zhou on 11/8/22.
//

import Foundation
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
  
  @Binding var selectedImage: UIImage?
  @Binding var isPickerShowing: Bool
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = .photoLibrary
    imagePicker.delegate = context.coordinator
    
    return imagePicker
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }
  
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  var parent : ImagePicker
  init(_ picker: ImagePicker) {
    self.parent = picker
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let image = info[UIImagePickerController.InfoKey.originalImage]
        as? UIImage {
      DispatchQueue.main.async {
        self.parent.selectedImage = image
        
      }
      
    }
    parent.isPickerShowing = false
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    parent.isPickerShowing = false
  }
  
}
