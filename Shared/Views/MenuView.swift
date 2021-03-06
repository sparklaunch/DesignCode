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
            Spacer()
            VStack(spacing: 16) {
                Text("Meng - 28% complete")
                    .font(.caption)
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: .zero, y: 5)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black.opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .cornerRadius(12)
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(colors: [.white, Color("GradientColor")], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: .zero, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image(decorative: "Avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
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
                .foregroundColor(Color("IconColor"))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
