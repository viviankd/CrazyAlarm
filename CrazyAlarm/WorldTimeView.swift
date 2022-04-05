//
//  WorldTime.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI
import Combine

struct WorldTimeView: View {
    
    @State private var showDetails = false
    @State private var Cityname = "Seattle"
    @State private var dateT = "Today"
    @State private var timeR = 0
    @State private var time = "8:00"
    @State private var ampm = "AM"
    
    @ObservedObject var cityLists = CityTimeList()
    @State var addbuttoShow: Bool = false
    
    var body: some View {
        let Swidth = UIScreen.main.bounds.size.width
        
        
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack(spacing: -2){
                    Spacer()
                    Form(){
                        List(){
                            HStack(alignment: .lastTextBaseline){
                                VStack(alignment: .leading, spacing: 1){
                                    Text(dateT + ", +" + String(timeR) + "HRS")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                    Text(Cityname)
                                        .font(.system(size: 30))
                                }
                                .frame(width: Swidth/2 - 45, height: 60, alignment: .bottomLeading)

                                Spacer()
                                HStack(alignment: .lastTextBaseline, spacing: -1){
                                    Text(time)
                                        .font(.system(size:45))
                                    Text(ampm)
                                }
                                .frame(width: Swidth/2 - 30, height: 60, alignment: .bottomTrailing)
                                Spacer()
                            }
                            .frame(width: Swidth - 60, height: 90, alignment: .center)
                            .offset(x:-10, y:0)
                        }
                    }
                }
                .navigationTitle("🗺️ World Clock")
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            withAnimation(.spring()){
                                addbuttoShow.toggle()
                            }
                        }) {
                            Text(Image(systemName: "plus")).font(.system(size: 20).bold())
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                        }) {
                            Text("Edit").font(.system(size: 20).bold())
                        }
                    }
                }
                if addbuttoShow{
                    cityChoose()
                        .transition(.move(edge: .bottom))
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


struct cityChoose: View {

    @State var searchString = ""
    var body: some View{
        
        NavigationView{
            List{
                ForEach(0..<100){
                    Text("Number \($0)")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Choose a city")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.gray.ignoresSafeArea())
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                
            }
            .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}
