//
//  WorldTime.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct WorldTimeView: View {
    @State private var showDetails = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                                
                VStack{
                    if showDetails{
                        Worldtime()
                            .transition(.move(edge: .bottom))
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {

                        }) {
                            Text("Edit").font(.system(size: 20).bold())
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            withAnimation(.spring()){
                                showDetails.toggle()
                            }
                        }) {
                            Text(Image(systemName: "plus")).font(.system(size: 20).bold())
                        }
                    }
                }
            }
        }
    }
}

struct WorldTimeView_Previews: PreviewProvider {
    static var previews: some View {
        WorldTimeView()
    }
}
