//
//  FlightTime.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct FlightTimeView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()

                
                VStack{
                    
                    
                    
                }
                .navigationTitle("Flight Time")
                .navigationBarTitleDisplayMode(.large)
                
                
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
                    }) {
                        Text(Image(systemName: "plus")).font(.system(size: 20).bold())
                    }
                }
            }
        }
    }
}

struct FlightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FlightTimeView()
    }
}
