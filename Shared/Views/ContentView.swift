//
//  ContentView.swift
//  Shared
//
//  Created by Jinwook Kim on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    @State private var show: Bool = false
    @State private var viewState: CGSize = .zero
    @State private var showCard: Bool = false
    @State private var bottomState: CGSize = .zero
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: self.show ? 20 : .zero)
                .opacity(showCard ? 0.4 : 1.0)
                .offset(y: showCard ? -200 : .zero)
                .animation(.default
                    .delay(0.1)
                           , value: self.show)
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color(self.show ? "card3" : "card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: .zero, y: self.show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : .zero)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(self.show ? .zero : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : .zero))
                .rotation3DEffect(Angle(degrees: showCard ? .zero : 10), axis: (x: 10, y: .zero, z: .zero))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: self.show)
            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color(self.show ? "card4" : "card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: .zero, y: self.show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : .zero)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: self.show ? .zero : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : .zero))
                .rotation3DEffect(Angle(degrees: showCard ? .zero : 5), axis: (x: 10, y: .zero, z: .zero))
                .blendMode(.hardLight)
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : .zero)
                .blendMode(.hardLight)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        self.showCard.toggle()
                    }
                }
                .gesture(DragGesture().onChanged { value in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                        self.viewState = value.translation
                    }
                }
                    .onEnded { value in
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                            viewState = .zero
                        }
                    })
            BottomCardView()
                .offset(x: .zero, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: self.show ? 20 : .zero)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1.0, duration: 0.8), value: self.show)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            bottomState = value.translation
                        }
                        .onEnded { value in
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                                if bottomState.height > 50 {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: .zero)) {
                                        showCard = false
                                    }
                                }
                                else {
                                    bottomState = .zero
                                }
                            }
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
