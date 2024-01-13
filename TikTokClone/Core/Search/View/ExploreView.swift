//
//  ExploreView.swift
//  TikTokClone
//
//  Created by User on 10.1.2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel: ExploreViewModel
    init(
        userService: UserServiceProtocol
    ) {
        self._viewModel = StateObject(wrappedValue: ExploreViewModel(service: userService))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(self.viewModel.users, id: \.self) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView(userService: DIContainer.mock.userService)
}
