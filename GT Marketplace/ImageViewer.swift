//
//  ImageView.swift
//  GT Marketplace
//
//  Created by Eric Zhou on 11/8/22.
//

import SwiftUI
import FirebaseStorage

struct ImageViewer: View {
  @State var isPickerShowing = false;
  @State var selectedImage: UIImage?
  @State var listingImages: [UIImage?] = []
  var counter = 0
    var body: some View {
      VStack {
        if selectedImage != nil {
          Image(uiImage: selectedImage!)
            .resizable()
            .frame(width: 200, height: 200)
        }
        
        Button {
          isPickerShowing = true
        } label: {
          Text("Select A Photo")
        }
        
        if selectedImage != nil {
          Button {
            listingImages.append(UIImage(named: "image" + String(counter) + ".jpg")!)
            print(listingImages.count)
          } label: {
            Text("Upload Photo")
          }
        }
      }
      .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
        ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
      }
    }
  
    func uploadPhoto(id: UUID, selectedImage: UIImage?) {
      print("BANANA")
      guard selectedImage != nil else {
        return
      }
      print("CANTALOPE")
      let storageRef = Storage.storage().reference()
      
      let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
      
      guard imageData != nil else {
        return
      }
      print("APPLE")
      let fileRef = storageRef.child("listingsImages/\(UUID().uuidString).jpg")
      
      let uploadTask = fileRef.putData(imageData!, metadata: nil) {
        metadata, error in
        
        if (error == nil && metadata != nil) {
          
        }
            
      }
    }
}

/*struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer()
    }
}*/
