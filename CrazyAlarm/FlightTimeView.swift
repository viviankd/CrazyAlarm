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
                    Spacer()
                    Form(){
                        Section(header: HStack{
                            Text("Tomorrow")
                                .offset(x: -25, y:0)
                            Spacer()
                            Text("2:33pm")
                                .offset(x: 25, y:0)
                        }.font(.system(size: 15).bold())){
                            VStack{
                                Spacer()
                                HStack(spacing:15){
                                    VStack(alignment:.leading){
                                        Text("🇺🇸Chicago")
                                        HStack(alignment: .firstTextBaseline){
                                            Text("ORD")
                                                .font(.system(size: 30))
                                            Text("18:52")
                                                .font(.headline)
                                        }
                                    }
                                    Spacer()
                                    VStack(alignment:.trailing){
                                        Text("🇺🇸New York")
                                        HStack(alignment: .lastTextBaseline){
                                            Text("22:22")
                                                .font(.headline)
                                            Text("JFK")
                                                .font(.system(size: 30))
                                        }
                                    }
                                }
                                
                                Spacer()
                                Spacer()
                                Spacer()

                                HStack(spacing:20){
                                    VStack(alignment:.leading){
                                        Text("Flight")
                                        Text("DL 5223")
                                    }
                                    VStack(alignment:.leading){
                                        Text("Status")
                                        Text("On time")
                                    }
                                    VStack(alignment:.center){
                                        Text("Terminal")
                                        HStack{
                                            Text(Image(systemName: "airplane.departure"))
                                            Text("2")
                                        }
                                    }
                                    VStack(alignment:.center){
                                        Text("Gate")
                                        Text("7")
                                    }
                                    
                                    AsyncImage(
                                        url: URL(string: "data:image/png;base64,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"),
                                        content: { image in
                                            image.resizable()
                                                 .aspectRatio(contentMode: .fit)
                                                 .frame(maxWidth: 30, maxHeight: 30)
                                                 .offset(x:30, y:0)
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                                    Spacer()
                                }.font(.system(size: 15))

                                Divider()
                                    .background(Color.blue)

                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Now")
                                            .font(.system(size: 12).bold())
                                            .foregroundColor(.gray)
                                        Text("Check-in")
                                            .font(.headline)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing){
                                        Text("Ends in 18:22")
                                            .font(.system(size: 12).bold())
                                            .foregroundColor(.gray)
                                        Text("4h 15m")
                                            .font(.headline)
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                .navigationTitle("✈️ Flight Time")
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        
                        
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
        }
    }
}

struct FlightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FlightTimeView()
    }
}
