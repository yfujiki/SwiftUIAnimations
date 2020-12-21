//
//  FanAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Yuichi Fujiki on 19/12/20.
//

import SwiftUI

struct FanAnimationView: View {
    static let size = CGFloat(300)
    static let color = Color.red
    static let numBlades = 5.0

    @State var rotationOffset: Double = 0.0

    var body: some View {
        ZStack {
            ForEach(0..<Int(Self.numBlades)) { i in
                Blade()
                    .fill(Self.color)
                    .frame(width: Self.size, height: Self.size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(radians: .pi * 2 * Double(i) / Self.numBlades))
            }
        }
        .rotationEffect(Angle(radians: rotationOffset))
        .onAppear(perform: {
            withAnimation(Animation.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                rotationOffset += .pi * 2
            }
        })
    }
}

struct FanAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        FanAnimationView()
    }
}

struct Blade: Shape {
    func path(in rect: CGRect) -> Path {
        let topWidth = rect.width / 8
        let bottomWidth = rect.width / 4

        var path = Path()
        path.move(to: CGPoint(x: rect.midX - topWidth / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + topWidth / 2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + bottomWidth / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - bottomWidth / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - topWidth / 2, y: rect.midY))
        return path
    }
}
