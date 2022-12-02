//
//  ListingView.swift
//  GT Marketplace
//
//  Created by Rishi Aniga on 10/13/22.
//

import SwiftUI
import MapKit
import UIKit

struct CreateListingView: View {
<<<<<<< HEAD
    private var numberOfImages = 3
=======
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    
    private var numberOfImages = 4
>>>>>>> 346f7c3 (rachel's changes)
    private  let timer = Timer.publish(every: 10, on:
            .main, in: .common).autoconnect()
    @State private var currentIndex = 0;
    @State var title: String = ""
    @State var description: String = ""
    @State var category: String = "Category"
    @State private var price = 0
    @State private var priceToggle: Bool = false
    private let numberFormatter: NumberFormatter
    var model = Model()
    var imageView = ImageViewer()
    let id = UUID()
    
    func previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex
            - 1 : numberOfImages - 1
        }
    }
    
    func next() {
        withAnimation {
            currentIndex = currentIndex <
                numberOfImages ? currentIndex + 1 :
            0
        }
    }
    
    var controls: some View {
        HStack {
            Button {
                previous()
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Button {
                next()
            } label: {
                Image(systemName: "chevron.right")
            }
        }
    }
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
    }
    var body: some View {
        GeometryReader { proxy in
        ScrollView {
<<<<<<< HEAD
              VStack {
                  Text("Listing Details")
                    .padding()
                  TabView(selection: $currentIndex) {
                    ForEach(1..<4){_ in
                      imageView
                    }
                  }.tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .frame(width: proxy.size.width, height:
                            proxy.size.height / 3)
                    .onReceive(timer, perform: { _ in
                      next()
                    })
                  controls
                  Spacer()
                  Button {
                    for photo in imageView.listingImages {
                      imageView.uploadPhoto(id: id, selectedImage: photo)
                    }
                  } label: {
                    Text("Upload Photos")
                  }
                  TextField("Title", text: $title)
=======
            VStack(spacing: 0) {
                  Text("Listing Information")
                    .frame(maxWidth: 280, alignment: .leading)
                    .font(.system(size: 20, design: .default))
                    .padding(.top, 35)
                    .padding(.leading)
                    .padding(.trailing)
                Button(action: {
                    changeProfileImage = true
                    openCameraRoll = true
                    
                }, label: {
                    if changeProfileImage {
                        Image(uiImage : imageSelected)
                            .resizable()
                            .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding()
                        .frame(width: proxy.size.width, height: proxy.size.height / 3)
                    } else {
                        Image("listingImage")
                            .resizable()
                            .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .padding()
                        .frame(width: proxy.size.width, height: proxy.size.height / 3)
                    }
                    

                    
                })
                .sheet(isPresented: $openCameraRoll) {
                    ImagePicker2(selectedImage: $imageSelected, sourceType: .photoLibrary)

                }
//                  TabView(selection: $currentIndex) {
//                    ForEach(1..<numberOfImages + 1, id: \.self){ num in
//                      Image("\(num)")
//                        .resizable()
//                        .scaledToFill()
//                        .overlay(Color.black.opacity(0.4))
//                        .tag(num)
//
//                    }
//                  }.tabViewStyle(PageTabViewStyle())
//                    .clipShape(RoundedRectangle(cornerRadius: 5))
//                    .padding()
//                    .frame(width: proxy.size.width, height:
//                            proxy.size.height / 3)
//                    .onReceive(timer, perform: { _ in
//                      next()
//                    })
//                  controls
                Text("Title*")
                    .frame(maxWidth: 280, alignment: .leading)
                    .font(.system(size: 14, weight: .light, design: .default))
                
                
                  Text("Price*")
                    .frame(maxWidth: 280, alignment: .leading)
                    .font(.system(size: 14, weight: .light, design: .default))
                  HStack() {
                    TextField("", value: $price, formatter: numberFormatter)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .keyboardType(.numberPad)
                      .padding(.bottom)
                      .padding(.leading)
                      .padding(.trailing)
                    Toggle(
                      isOn: $priceToggle,
                      label: {
                        Text("Free")
                              .font(.system(size: 16, weight: .light, design: .default))
                              .padding(.leading, 30)
                      })
                    .toggleStyle(SwitchToggleStyle(tint: Color.purple))
                    TextField("Description", text: $description)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                    Text(category)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding()
                  }
                  LocationView()
                  Button {
                    model.pushListing(title: title, price: price, id: id)
                  } label: {
                    Text("Add Listing")
                  }

                    .padding(.bottom)
                    .padding(.leading)
                    .padding(.trailing)
                  }
                

//                  Button {
//                    model.pushListing(title: title, price: price)
//                  } label: {
//                    Text("Add Listing")
//                  }
                }
            }
        }
    }
}

struct ListingsView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListingView()
    }
}

