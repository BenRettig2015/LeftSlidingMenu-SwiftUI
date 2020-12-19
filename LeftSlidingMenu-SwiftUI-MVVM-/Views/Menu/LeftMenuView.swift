//
//  LeftMenuView.swift
//  KeechaoSwiftUI+Combine
//
//  Created by Hasan, MdAdit on 3/22/20.
// Recreated by Benjamin Rettig on 12/19/2020

//  Copyright © 2020 Hasan, MdAdit. All rights reserved.
//

import SwiftUI
import Combine

struct LeftMenuView: View {

    @Binding var showMenu: Bool

    var body: some View {
        HStack {
            List(menus, id: \.title) { item in
                MenuCell(showMenu: self.$showMenu, item: item)}
            
            Divider()
        }
        .padding(.top, 50)
            .navigationBarTitle(Text("").font(.title), displayMode: .inline)

    }

}


struct MenuCell: View {

    @Binding var showMenu: Bool

    var item: Menu


    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Image(systemName: item.icon)
                    .frame(width: 30)
                    .font(Font.system(size: 20, weight: .ultraLight))
                    .foregroundColor(.green)
                Text(item.title)
                    .foregroundColor(.green)
                    .font(Font.system(size: 18, weight: .light))
                    .multilineTextAlignment(.leading)
                Spacer()
                
            }

        }.padding()
            .onTapGesture(perform: {
                withAnimation {
                    self.showMenu.toggle()
                }
            })
    }
}


