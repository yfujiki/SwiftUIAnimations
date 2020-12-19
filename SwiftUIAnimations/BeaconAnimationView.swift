//
//  BeaconAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 18/12/20.
//

import SwiftUI

struct BeaconAnimationView: View {
    @State var scale: CGFloat = 0.5
    @State var opacity: Double = 1.0

    var body: some View {
        Circle()
            .fill(Color.red)
            .scaleEffect(0.5)
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(scale)
                    .opacity(opacity)
            )
        .onAppear(perform: {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: false)) {
                scale = 0.75
                opacity = Double(0.75 - scale) * 4
            }
        })
    }}

struct BeaconAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BeaconAnimationView()
    }
}
