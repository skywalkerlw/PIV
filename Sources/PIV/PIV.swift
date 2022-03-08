//
//  ProgressIndicatorView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 05.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

public struct PIV: View {
    public enum IndicatorType {
        case `default`(progress: Binding<CGFloat>)
        case bar(progress: Binding<CGFloat>, backgroundColor: Color = .clear)
        case impulseBar(progress: Binding<CGFloat>, backgroundColor: Color = .clear)
        case dashBar(progress: Binding<CGFloat>, numberOfItems: Int = 8, backgroundColor: Color = .clear)
        case circle(progress: Binding<CGFloat>, lineWidth: CGFloat, strokeColor: Color, backgroundColor: Color = .clear)
    }

    @Binding var isVisible: Bool
    var type: IndicatorType

    public init(isVisible: Binding<Bool>, type: IndicatorType) {
        _isVisible = isVisible
        self.type = type
    }

    public var body: some View {
        if isVisible {
            indicator
        } else {
            EmptyView()
        }
    }

    // MARK: - Private

    private var indicator: some View {
        ZStack {
            switch type {
            case let .bar(progress, backgroundColor):
                BarView(progress: progress, backgroundColor: backgroundColor)
            case let .impulseBar(progress, backgroundColor):
                ImpulseBarView(progress: progress, backgroundColor: backgroundColor)
            case let .default(progress):
                BarView(progress: progress, backgroundColor: Color.white)
            case let .circle(progress, lineWidth, strokeColor, backgroundColor):
                CircleView(progress: progress, lineWidth: lineWidth, strokeColor: strokeColor, backgroundColor: backgroundColor)
            case let .dashBar(progress, numberOfItems, backgroundColor):
                DashBarView(progress: progress, numberOfItems: numberOfItems, backgroundColor: backgroundColor)
            }
        }
    }
}
