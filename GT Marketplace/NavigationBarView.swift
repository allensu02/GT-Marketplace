//
//  NavigationBarView.swift
//  GT Marketplace
//
//  Created by Eric Zhou on 11/8/22.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
      TabView {
        ContentView()
          .tabItem {
            Text("Home")
          }
        .tabItem {
          Text("Search")
        }
        ListingView()
        .tabItem {
          Text("My Sales")
        }
        .tabItem {
          Text("Account")
        }
      }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
