//
//  ContentView.swift
//  TutorialLvnSwiftuiInteraction
//

import SwiftUI
import LiveViewNative
import LiveViewNativeLiveForm

struct ContentView: View {
    var body: some View {
        #LiveView(
            .automatic(
                // ここをURLに置き換えてください
                development: URL(string: "ここをURLに置き換えてください")!,
                production: URL(string: "ここをURLに置き換えてください")!
            ),
            addons: [
               .liveForm
            ]
        ) {
            ConnectingView()
        } disconnected: {
            DisconnectedView()
        } reconnecting: { content, isReconnecting in
            ReconnectingView(isReconnecting: isReconnecting) {
                content
            }
        } error: { error in
            ErrorView(error: error)
        }
    }
}
