//
//  ToggleSettingRow.swift
//  ModuleView
//
//  Created by MBA on 10/4/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public struct ToggleSettingRow: View {
    @State private var isOn = true

    public var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text("Switcher Setting Row")
            }
        }
    }
}

struct ToggleSettingRow_Previews: PreviewProvider {
    static var previews: some View {
        ToggleSettingRow()
    }
}
