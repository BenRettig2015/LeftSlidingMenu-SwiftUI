//
//  MenuViewModel.swift
//  LeftSlidingMenu-SwiftUI
//
//  Created by Hasan, MdAdit on 4/9/20.
// Recreated by Benjamin Rettig on 12/19/2020

//  Copyright © 2020 FirstAlert. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



class MenuViewModel: ObservableObject {
    
 

    @Published var viewType: MenuModel = .Home
    
    init(title:String) {
        
        switch title {
        case "Home":
            viewType = .Home
            break
        case "Accounts":
            viewType = .Accounts
            break
        case "FAQ":
            viewType = .FAQ
            break
        case "Terms & Privacy":
            viewType = .TermsAndPrivacy
            break
        default:
            viewType = .Home
            break
        }
    }
    

    
    func containedView() -> AnyView {
        
        switch viewType {
        case .Home:
            return AnyView(HomeView())
            
        case .Accounts:
            return AnyView(AccountView())
            
        case .FAQ:
            return AnyView(FAQView())
            
        case .TermsAndPrivacy:
            return AnyView(TermsAndPrivacyView())
        }
    }
    
    
  
}
