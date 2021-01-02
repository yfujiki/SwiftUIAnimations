//
//  GradationAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 22/12/20.
//

import SwiftUI

class GradationAnimationViewModel {
    private var displayLink: CADisplayLink?
    @Published var animationState: Double = 0.0

    func registerForAnimation() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateAnimationState))
        displayLink?.preferredFramesPerSecond = 30
        displayLink?.add(to: RunLoop.main, forMode: .default)
    }

    @objc func updateAnimationState() {
        let newState = animationState + 0.0055
        animationState = newState - Double(Int(newState))
    }
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
                viewModel.registerForAnimation()
            })
            .onReceive(viewModel.$animationState, perform: { state in
                changeColor(colorState: state)
            })
    }

    func changeColor(colorState: Double) {
        startColor = Color(hue: colorState, saturation: 1.0, brightness: 1.0)
        var endColorHue = colorState + Self.hueRange
        endColorHue -= Double(Int(endColorHue))
        endColor = Color(hue: endColorHue, saturation: 1.0, brightness: 1.0)
    }
}

struct GradationAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        GradationAnimationView()
    }
}
