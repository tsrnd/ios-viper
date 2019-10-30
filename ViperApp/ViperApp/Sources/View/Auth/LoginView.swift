//
//  LoginView.swift
//  ModuleView
//
//  Created by MBA on 10/2/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

public protocol LoginHandler: AnyObject {
    func login()
}

public struct LoginView: View {
    @State private var name: String = ""
    @State private var msg: String = ""

    public var hdlr: LoginHandler?

    public init() { }

    public var body: some View {
        VStack {
            Text("LOGIN")
            HStack {
                TextField("Name:", text: $name)
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                Text(msg)
            }
            Button(action: { self._login() }) {
                Text("Login")
            }
        }
    }

    private func _login() {
        msg = "Hello \(name)!"
        hdlr?.login()
    }
}

#if DEBUG
    public struct LoginView_Previews: PreviewProvider {
        public static var previews: some View {
            LoginView()
        }
    }
#endif
