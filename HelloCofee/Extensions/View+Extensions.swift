//
//  View+Extensions.swift
//  HelloCofee
//
//  Created by Anup Saud on 2024-09-04.
//

import Foundation
import SwiftUI

extension View{
    func centerHorizontally() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    @ViewBuilder
    func visible(_ value:Bool) -> some View{
        switch value {
        case true:
            self
        case false:
            EmptyView()
    
            
        }
    }
}
