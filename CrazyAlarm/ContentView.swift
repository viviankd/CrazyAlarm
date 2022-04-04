//
//  ContentView.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var flightnum = 1

    var body: some View {
        TabView{
            AlarmView()
                .tabItem{
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
            WorldTimeView()
                .tabItem{
                    Image(systemName: "globe.europe.africa.fill")
                    Text("World")
                }
            GameView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            FlightTimeView()
                .tabItem{
                    Image(systemName: "airplane.departure")
                    Text("Flight")
                }
                .badge(flightnum)
        }
        .onAppear(){
            UITabBar.appearance().backgroundColor = .systemYellow
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
