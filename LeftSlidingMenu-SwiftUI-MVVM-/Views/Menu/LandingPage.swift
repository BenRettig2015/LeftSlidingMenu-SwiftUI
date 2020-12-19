//
//  DeviceLandingPage.swift
//  FirstAlertSA
//
//  Created by Hasan, MdAdit on 4/8/20.
// Recreated by Benjamin Rettig on 12/19/2020

//  Copyright © 2020 First Alert Inc. All rights reserved.
//

import SwiftUI
import Combine

struct LandingPage: View {

    @ObservedObject var mvModel = MenuViewModel(title: "Home")
    @State var showMenu = false

    var drag = DragGesture()
        .onEnded { if $0.translation.width < -100 { withAnimation { } } }


    init() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor.orange
        standardAppearance.shadowColor = UIColor.orange

        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.backgroundColor = UIColor.orange
        compactAppearance.shadowColor = .orange

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = UIColor.green
        scrollEdgeAppearance.shadowColor = UIColor.green

        UINavigationBar.appearance().standardAppearance = standardAppearance
        UINavigationBar.appearance().compactAppearance = compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }

    var body: some View {



        GeometryReader { geometry in

            NavigationView {
                ZStack(alignment: .leading) {

                    self.mvModel.containedView()

                        .navigationTitle(Text(self.mvModel.viewType.rawValue).font(.title))
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(leading: (
                            Button(action: { withAnimation {
                                self.showMenu.toggle()
                            }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .frame(width: 44, height: 44)
                                    .imageScale(.large)
                                    .foregroundColor(Color.black)
                            }))
                        .frame(width: geometry.size.width,
                            height: geometry.size.height)
                        .offset(x: self.showMenu ? ((geometry.size.width / 2) + 80) : 0)

                    if self.showMenu {
                        LeftMenuView(showMenu: self.$showMenu)
                            .frame(width: ((geometry.size.width / 2) + 80))
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
        }
    }
}



/*


extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .white
        
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = .green
        
        let compactAppearance = UINavigationBarAppearance()
        compactAppearance.backgroundColor = .orange
        
        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar.compactAppearance = compactAppearance
    }
}


*/


