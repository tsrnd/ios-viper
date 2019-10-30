//
//  FeedListView.swift
//  ViperApp
//
//  Created by MBA on 12/18/19.
//  Copyright © 2019 MBA. All rights reserved.
//

import SwiftUI

protocol FeedListHandler {
    func showDetail(ofFeed: Any)
}

struct FeedListView: View {

    public var hdlr: FeedListHandler?

    var body: some View {
        NavigationView {
            List {
                FeedRow()
            }.navigationBarTitle("New")
        }.navigationBarTitle("FEEDS")
    }
}

#if DEBUG
    struct FeedListView_Previews: PreviewProvider {
        static var previews: some View {
            FeedListView()
        }
    }
#endif
