//
//  BounceAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 18/12/20.
//

import SwiftUI

struct BounceAnimationView: View {
    @State var scale: CGFloat = 1.0

    var body: some View {
        Circle()
            .fill(Color.red)
            .scaleEffect(0.5)
        .scaleEffect(scale)
        .onAppear(perform: {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                scale = 1.5
            }
        })
    }
}

struct BounceAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BounceAnimationView()
    }
}
