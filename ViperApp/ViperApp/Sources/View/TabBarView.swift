//
//  TabBarView.swift
//  ModuleView
//
//  Created by MBA on 10/4/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public struct TabBarView: View {
    @State private var selection = 1

    public var body: some View {
        VStack {
            TabView(selection: $selection) {
                FeedListView()
                    .tabItem {
                        Image("house")
                        Text("Tab 1")
                    }.tag(1)
                SettingListView()
                    .tabItem {
                        Image("gear")
                        Text("Tab 2")
                    }.tag(2)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
