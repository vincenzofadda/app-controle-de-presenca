//
//  HUBView.swift
//  MultipleViews
//
//  Created by user on 12/05/23.
//

import SwiftUI


struct HubView: View {
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack{
                    gradient
                        .ignoresSafeArea()
                    
                    VStack {
                        
                    }
                }
            }
        }
    }
}

struct HubView_Previews: PreviewProvider {
    static var previews: some View {
        HubView()
    }
}


