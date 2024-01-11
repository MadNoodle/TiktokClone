//
//  CustomTextFieldModifier.swift
//  TikTokClone
//
//  Created by User on 11.1.2024.
//

import SwiftUI

struct StandardTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}

extension View {
    func standard() -> some View {
        modifier(StandardTextFieldModifier())
    }
}
