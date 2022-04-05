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
            MenuRow(title: "Account", icon: "gear")
            MenuRow(title: "Billing", icon: "creditcard")
            MenuRow(title: "Sign Out", icon: "person.crop.circle")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    let title: String
    let icon: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
