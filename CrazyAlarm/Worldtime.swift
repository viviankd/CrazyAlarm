//
//  Worldtime.swift
//  CrazyAlarm
//
//  Created by Ming Xia on 4/4/22.
//

import SwiftUI
import Foundation
import Combine

struct CityTime: Identifiable {
    
    var id = String()
    var city = String()
    var time = Date()
    
}

class CityTimeList : ObservableObject {
    @Published var cities = [CityTime]()
}
