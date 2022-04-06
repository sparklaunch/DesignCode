//
//  Home.swift
//  DesignCode (iOS)
//
//  Created by Jinwook Kim on 2022/04/06.
//

import SwiftUI

struct Home: View {
    @State private var showProfile: Bool = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                            showProfile.toggle()
                        }
                    } label: {
                        Image(decorative: "Avatar")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                Spacer()
            }
            MenuView()
                .offset(y: showProfile ? .zero : 600)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
