//
//  SwiftUIView.swift
//  GT Marketplace
//
//  Created by Max Yuan on 10/4/22.
//
import SwiftUI

struct ListingView: View {
    
    @StateObject private var model = Model()
    
    var body: some View {
        NavigationView {
            
            List{
                ForEach(model.listings){
                    Listing in NavigationLink(destination: SwiftUIView()) {
                            ListingCardView(listing: Listing)
                        }
                }.onDelete(perform: delete)
            }
            .onAppear {
                model.listings = []
                model.listentoRealtimeDatabase()
            }.onDisappear {
                model.stopListening()
            }
            .navigationBarTitle("Listings")
            .navigationBarItems(
                trailing: NavigationLink(destination: CreateListingView(), label: {Image(systemName:"plus")}))
        }
    }
    func delete(at offsets: IndexSet) {
        offsets.sorted(by: >).forEach { (i) in
            model.deleteListing(id: model.listings[i].id)
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView()
    }
}
