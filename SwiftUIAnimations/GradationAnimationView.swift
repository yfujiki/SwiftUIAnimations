//
//  GradationAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 22/12/20.
//

import SwiftUI

class GradationAnimationViewModel {
    @Published var animationState: Double = 0.0
}

struct GradationAnimationView: View {
    @State var startColor = Color(hue: 0.0, saturation: 1.0, brightness: 1.0)
    @State var endColor = Color(hue: Self.hueRange, saturation: 1.0, brightness: 1.0)
    @State var viewModel = GradationAnimationViewModel()

    static let animationInterval = 0.015
    static let hueRange = 0.8

    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 300, height: 300, alignment: .center)
            .onAppear(perform: {
                changeColor(colorState: viewModel.animationState)
            })
            .onReceive(viewModel.$animationState, perform: { state in
                changeColor(colorState: state)
            })
    }

    func changeColor(colorState: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Self.animationInterval) {
            startColor = Color(hue: colorState, saturation: 1.0, brightness: 1.0)
            var endColorHue = colorState + Self.hueRange
            endColorHue -= Double(Int(endColorHue))
            endColor = Color(hue: endColorHue, saturation: 1.0, brightness: 1.0)

            var nextValue = viewModel.animationState + 0.0055
            if nextValue > 1.0 {
                nextValue = 0.0
            }
            viewModel.animationState = nextValue
        }
    }
}

struct GradationAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        GradationAnimationView()
    }
}
