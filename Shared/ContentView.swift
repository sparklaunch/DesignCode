//
//  ContentView.swift
//  Shared
//
//  Created by Jinwook Kim on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("UI Design")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Certificate")
                    .foregroundColor(Color("accent"))
            }
            Image("Logo1")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
