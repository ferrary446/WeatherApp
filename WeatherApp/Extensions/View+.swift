//
//  View+.swift
//  WeatherApp
//
//  Created by Ilya Yushkov on 26.10.2022.
//

import SwiftUI

extension View {
    func gradientBackground(colorScheme: ColorScheme) -> some View {
        ZStack {
            LinearGradient(
                colors: colorScheme == .light ? [.white, .white, .blue] : [.black],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .ignoresSafeArea()
            self
        }
    }

    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
