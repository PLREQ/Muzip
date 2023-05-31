//
//  WaveAnimaion.swift
//  Muzip
//
//  https://github.com/Wavemaster111188/AnimatedWaveform?ref=iosexample.com

import SwiftUI

public struct WaveAnimaionView: View {
    var color: Color = .accentColor
    var renderingMode: RenderingMode = .monochrome
    var secondaryColor: Color? = nil
    var animated: Bool = true

    public init(color: Color = .accentColor, renderingMode: WaveAnimaionView.RenderingMode = .monochrome, secondaryColor: Color? = nil, animated: Bool = true) {
        self.color = color
        self.renderingMode = renderingMode
        self.secondaryColor = secondaryColor
        self.animated = animated
    }

    private var ringColor: Color {
        switch renderingMode {
        case .hierarchical:
            return color.opacity(0.5)
        case .monochrome:
            return color
        case .palette:
            return secondaryColor ?? color
        }
    }

    @State private var lineLenghts: [CGFloat] = [5, 20, 30, 15, 25, 10]

    public var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let gradient = RadialGradient(colors: [ringColor, color], center: UnitPoint.center, startRadius: width/2.5, endRadius: width/2.5-1)

            WaveAnimaion(lineLenghts: lineLenghts)
                .strokeBorder(gradient, style: StrokeStyle(lineWidth: width/16, lineCap: .round), antialiased: true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
                .onAppear {
                    if animated {
                        withAnimation(.linear(duration: 0.7).repeatForever()) {
                            lineLenghts = [20, 10, 2, 25, 10, 2]
                        }
                    }
                }
        }
    }

    public enum RenderingMode {
        case hierarchical, monochrome, palette
    }
}

/// The actual Shape for the animating wave form.
struct WaveAnimaion: InsettableShape {

    // MARK: - Property
    var lineLenghts: [CGFloat]

    // MARK: - Animatable
    var animatableData: AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>>> {
        get {
            AnimatablePair(
                lineLenghts[0],
                AnimatablePair(
                    lineLenghts[1],
                    AnimatablePair(
                        lineLenghts[2],
                        AnimatablePair(
                            lineLenghts[3],
                            AnimatablePair(
                                lineLenghts[4],
                                lineLenghts[5]
                            )
                        )
                    )
                )
            )
        }

        set {
            lineLenghts[0] = CGFloat(newValue.first)
            lineLenghts[1] = CGFloat(newValue.second.first)
            lineLenghts[2] = CGFloat(newValue.second.second.first)
            lineLenghts[3] = CGFloat(newValue.second.second.second.first)
            lineLenghts[4] = CGFloat(newValue.second.second.second.second.first)
            lineLenghts[5] = CGFloat(newValue.second.second.second.second.second)
        }
    }

    // MARK: - Conformance to InsettableShape
    var insetAmount = 0.0

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

    // MARK: - The path
    func path(in rect: CGRect) -> Path {
        let w = rect.width/100
        let h = rect.height/100

        let lines: [[CGPoint]] = [
            [CGPoint(x: w*25, y: rect.midY - h*lineLenghts[0]),
             CGPoint(x: w*25, y: rect.midY + h*lineLenghts[0])],
            [CGPoint(x: w*35, y: rect.midY - h*lineLenghts[1]),
             CGPoint(x: w*35, y: rect.midY + h*lineLenghts[1])],
            [CGPoint(x: w*45, y: rect.midY - h*lineLenghts[2]),
             CGPoint(x: w*45, y: rect.midY + h*lineLenghts[2])],
            [CGPoint(x: w*55, y: rect.midY - h*lineLenghts[3]),
             CGPoint(x: w*55, y: rect.midY + h*lineLenghts[3])],
            [CGPoint(x: w*65, y: rect.midY - h*lineLenghts[4]),
             CGPoint(x: w*65, y: rect.midY + h*lineLenghts[4])],
            [CGPoint(x: w*75, y: rect.midY - h*lineLenghts[5]),
             CGPoint(x: w*75, y: rect.midY + h*lineLenghts[5])]
        ]

        return Path { path in
            // two arcs to make it wider
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount - 2, startAngle: .zero, endAngle: .degrees(360), clockwise: false)

            for line in lines {
                path.addLines(line)
            }
        }
    }
}
