//
//  ContentView.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Time = "00:00"
    @State private var buttonisOn = true
    @State private var gamebuttonisOn = false
    @State private var mountAlarm = 1

    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section("😴Sleep  |  😃Wake up"){
                        HStack{
                            VStack{
                                Text(Time)
                                    .font(.largeTitle)
                                Text("Alarm")
                            }
                            Toggle(isOn: $buttonisOn) {
                            }
                        }.padding()
                    }
                    
                    Section("💔 Crazy Gaming"){
                        Toggle("Crazy Music", isOn: $gamebuttonisOn).padding()
                        Toggle("Crazy Games", isOn: $gamebuttonisOn).padding()
                        Toggle("Crazy XXXXX", isOn: $gamebuttonisOn).padding()
                    }
                }
                .navigationTitle("👻CrazyAlarm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            mountAlarm = mountAlarm + 1
                            print("mount1 = \(mountAlarm)")
                        }) {
                            Label("Add", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            mountAlarm = mountAlarm + 1
                            print("mount2 = \(mountAlarm)")
                        }) {
                          Text("Edit")
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack{
                Spacer()

                VStack{
                    Button(action: {
                    }) {
                        Text(Image(systemName: "globe.europe.africa.fill"))
                            .font(.system(size: 30))
                    }
                    Text("World")
                        .font(.system(size: 15))
                        .bold()
                        .italic()
                }
                Spacer()
                VStack{
                    Button(action: {
                    }) {
                        Text(Image(systemName: "alarm"))
                            .font(.system(size: 30))
                    }
                    Text("Alarm")
                        .font(.system(size: 15))
                        .bold()
                        .italic()
                }
                Spacer()
                VStack{
                    Button(action: {
                    }) {
                        Text(Image(systemName: "gamecontroller"))
                            .font(.system(size: 30))
                    }
                    Text("Game")
                        .font(.system(size: 15))
                        .bold()
                        .italic()
                }
                Spacer()
                VStack{
                    Button(action: {
                    }) {
                        Text(Image(systemName: "airplane.departure"))
                            .font(.system(size: 30))

                    }
                    Text("Flight")
                        .font(.system(size: 15))
                        .bold()
                        .italic()
                }
                Spacer()

            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
