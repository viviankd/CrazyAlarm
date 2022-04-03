//
//  ContentView.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var Time = "00:00"
    var body: some View {
        VStack{
            
            HStack{
                Button("+"){
                }
                
                Spacer()
                
                Button("Edit"){
                }
            }.padding()
            
            NavigationView{
                Form{
                    Section("Sleep | Wake up"){
                        Text(Time)
                            .padding()
                        Text(Time)
                            .padding()
                        Text(Time)
                            .padding()
                        Text(Time)
                            .padding()
                        Text(Time)
                            .padding()
                    }
                    .navigationTitle("CrazyAlarm")
                    
                    Section("Crazy Gaming"){
                        Text("Game 1")
                            .padding()
                        Text("Game 2")
                            .padding()
                        Text("Game 3")
                            .padding()
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
