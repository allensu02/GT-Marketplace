//
//  ItemTileView.swift
//  GT Marketplace
//
//  Created by Shreya Malpani on 9/29/22.
//

import SwiftUI

struct ItemTileView: View {
    @State var item: Item
    var body: some View {
        HStack {
            VStack {
                Image(item.picture)
                    .resizable()
            }
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.system(size: 22))
                    .bold()
                    .padding(.bottom, 5)
                Text(item.description)
                Spacer()
                HStack {
                    HStack{
                        Button {
                            item.toggleFavorite()
                        } label: {
                            if (item.isFavorited) {
                                Image(systemName: "heart.fill")
                            } else {
                                Image(systemName: "heart")
                            }
                        }

                        Text("\(item.likes)")
                    }
                    HStack {
                        Image(systemName: "star")
                        Text("\(item.comments)")
                    }
                    Spacer()
                }
            }
        }
        .frame(height: 175)
        .padding(15)
    }
}

struct ItemTileView_Previews: PreviewProvider {
    static var previews: some View {
        ItemTileView(item: Item(name: "GT Hoodie", description: "Yellow Georgia Tech Hoodie, Size M", picture: "hoodie", likes: 2, comments: 0, isFavorited: false))
    }
}
