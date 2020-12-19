//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: BounceAnimationView()) {
                    Text("Bounce")
                }
                NavigationLink(destination: BeaconAnimationView()) {
                    Text("Beacon")
                }
            }
            .padding()
            .navigationBarTitle("Animation List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
