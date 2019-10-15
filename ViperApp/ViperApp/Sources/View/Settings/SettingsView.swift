//
//  SettingsView.swift
//  ModuleView
//
//  Created by MBA on 10/4/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public struct SettingsView: View {
    public var body: some View {
        NavigationView {
            List {
                ToggleSettingRow()
            }.navigationBarTitle("Privacy")
        }.navigationBarTitle("SETTINGS")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
