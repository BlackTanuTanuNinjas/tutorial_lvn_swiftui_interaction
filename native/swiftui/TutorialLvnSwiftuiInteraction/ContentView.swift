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
                development: URL(string: "https://0a6b-125-13-7-104.ngrok-free.app")!,
                production: URL(string: "https://0a6b-125-13-7-104.ngrok-free.app")!
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
