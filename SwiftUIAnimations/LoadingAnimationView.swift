//
//  LoadingAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 24/12/20.
//

import SwiftUI

struct LoadingAnimationView: View {
    var body: some View {
        LoadingIndicator()
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}

struct LoadingIndicator: View {
    static let startColor = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0)
    static let endColor = Color(.sRGB, red: 1.0, green: 0.0, blue: 0.0, opacity: 0.0)
    static let lineWidth: CGFloat = 30
    static let size: CGFloat = 100

    let strokeGradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startAngle: LoadingShape.startAngle, endAngle: LoadingShape.endAngle)

    let strokeStyle = StrokeStyle(lineWidth: Self.lineWidth, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0)

    @State var rotationOffset: Double = 0

    var body: some View {
        LoadingShape()
            .stroke(strokeGradient, style: strokeStyle)
            .padding(Self.lineWidth / 2)
            .frame(width: Self.size)
            .rotationEffect(Angle(radians: rotationOffset))
            .onAppear(perform: {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: false)) {
                    rotationOffset += .pi * 2
                }
            })
    }
}

struct LoadingShape: Shape {
    static let startAngle = Angle(radians: 3 * .pi / 2)
    static let endAngle = Angle(radians: 0)

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: Self.startAngle, endAngle: Self.endAngle, clockwise: true)

        return path
    }
}
