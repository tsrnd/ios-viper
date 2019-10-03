//
//  LoginView.swift
//  ModuleView
//
//  Created by MBA on 10/2/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public struct LoginView: View {

    @State private var name: String = ""

    public init() { }

    public var body: some View {
        VStack {
            Text("Login")
            HStack {
                TextField("Name:", text: $name)
                Text("Hello \(name)!")
            }
        }
    }
}

#if DEBUG
    public struct LoginView_Previews: PreviewProvider {
        public static var previews: some View {
            LoginView()
        }
    }
#endif
