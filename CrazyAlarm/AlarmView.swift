//
//  Alarm.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct AlarmView: View {
    @State private var Time = "00:00"
    @State private var buttonisOn = false
    @State private var gamebuttonisOn = false
    @State private var musicuttonisOn = false
    @State private var puzzlebuttonisOn = false
    @State private var mountAlarm = 1
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    Form{
                        Section(header: Text("😴Sleep  |  😃Wake up").font(.headline).foregroundColor(.gray)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(Time)
                                        .font(.largeTitle)
                                    Text("Alarm")
                                        .font(.system(size: 15))
                                }
                                Toggle(isOn: $buttonisOn) {
                                }
                            }.padding()
                        }
                        
                        Section(header: Text("💔 Crazy Alert").font(.headline).foregroundColor(.gray)){
                            Toggle("Crazy Games", isOn: $gamebuttonisOn).padding()
                            Toggle("Crazy Musics", isOn: $musicuttonisOn).padding()
                            Toggle("Crazy Puzzles", isOn: $puzzlebuttonisOn).padding()
                        }
                        .navigationTitle("👻CrazyAlarm")
                    }.onAppear {
                        UITableView.appearance().backgroundColor = .clear
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 20).bold())
                    Spacer()
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                mountAlarm = mountAlarm + 1
                                print("mount2 = \(mountAlarm)")
                            }) {
                                Text("Edit").font(.system(size: 20).bold())
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading){
                            Button(action: {
                                mountAlarm = mountAlarm + 1
                                print("mount1 = \(mountAlarm)")
                            }) {
                                Text(Image(systemName: "plus")).font(.system(size: 20).bold())
                            }
                        }
                    }
                   
                }
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
