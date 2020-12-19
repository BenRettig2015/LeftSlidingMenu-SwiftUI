//
//  MenuModel.swift
//  LeftSlidingMenu-SwiftUI
//
//  Created by Hasan, MdAdit on 4/9/20.
// Recreated by Benjamin Rettig on 12/19/2020

//  Copyright © 2020 FirstAlert. All rights reserved.
//

import Foundation

struct Menu {
    var title:String
    var icon:String
}



public enum MenuModel: String {
    case Home
    case Accounts
    case FAQ
    case TermsAndPrivacy
}

var menus = [Menu(title: "Home", icon: "house"),
    Menu(title: "Accounts", icon: "person.crop.circle"),
    Menu(title: "FAQ", icon: "questionmark.circle"),
    Menu(title: "Terms & Privacy", icon: "doc.fill")]
