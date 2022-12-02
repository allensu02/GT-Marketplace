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
    private var numberOfImages = 3
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
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                  HStack() {
                    TextField("$0.00", value: $price, formatter: numberFormatter)
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .keyboardType(.numberPad)
                      .padding()
                    Toggle(
                      isOn: $priceToggle,
                      label: {
                        Text("Free")
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
