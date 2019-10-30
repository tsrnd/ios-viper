//
//  ActionSettingRow.swift
//  ViperApp
//
//  Created by MBA on 12/18/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public protocol ActionSettingHandler: AnyObject {
    func showNestedView()
}

struct ActionSettingRow: View {
    
    public var hdlr: ActionSettingHandler?
    
    var body: some View {
        Button(action: {  }) {
            Text("Action Setting Row")
        }
    }
    
    private func _showNestedView() {
        hdlr?.showNestedView()
    }
}

struct ActionSettingRow_Previews: PreviewProvider {
    static var previews: some View {
        ActionSettingRow()
    }
}
