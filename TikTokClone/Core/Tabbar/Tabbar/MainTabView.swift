//
//  MainTabView.swift
//  TikTokClone
//
//  Created by User on 10.1.2024.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    @State private var selectedTab = 0
    
    // MARK: - UI
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName:self.selectedTab == 0 ? "house.fill": "house")
                            .environment(\.symbolVariants, self.selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear { self.selectedTab = 0}
                .tag(0)
            
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.2")
                            .environment(\.symbolVariants, self.selectedTab == 1 ? .fill : .none)
                        Text("Friends")
                    }
                }
                .onAppear { self.selectedTab = 1}
                .tag(1)
            
            Text("Upload Post")
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                    }
                }
                .onAppear { self.selectedTab = 2}
                .tag(2)
            
            NotificationsView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, self.selectedTab == 3 ? .fill : .none)
                        Text("notifications")
                    }
                }
                .onAppear { self.selectedTab = 3}
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, self.selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear { self.selectedTab = 4}
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
