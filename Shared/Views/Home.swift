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
            Color(.lightGray)
                .edgesIgnoringSafeArea(.all)
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
            .background(
                Color .white
                    .edgesIgnoringSafeArea(.all)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous ))
            .offset(y: showProfile ? -450 : .zero)
            .shadow(color: .black.opacity(0.2), radius: 20, x: .zero, y: 20)
            .rotation3DEffect(Angle(degrees: showProfile ? -10 : .zero), axis: (x: 10, y: .zero, z: .zero))
            .scaleEffect(showProfile ? 0.9 : 1.0)
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
