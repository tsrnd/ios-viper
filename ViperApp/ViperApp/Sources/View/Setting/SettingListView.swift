//
//  SettingListView.swift
//  ModuleView
//
//  Created by MBA on 10/4/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public struct SettingListView: View {
    public var body: some View {
        NavigationView {
            List {
                ToggleSettingRow()
                ActionSettingRow()
            }.navigationBarTitle("Privacy")
        }.navigationBarTitle("SETTINGS")
    }
}

struct SettingList_Previews: PreviewProvider {
    static var previews: some View {
        SettingListView()
    }
}
