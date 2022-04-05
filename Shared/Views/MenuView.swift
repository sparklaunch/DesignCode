//
//  MenuView.swift
//  DesignCode (iOS)
//
//  Created by Jinwook Kim on 2022/04/05.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            MenuRow()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "gear")
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
            Text("Account")
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}
