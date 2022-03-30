//
//  StationArrivalDataResponseModel.swift
//  SubwayStation
//
//  Created by haeseongJung on 2022/03/30.
//

import Foundation

struct StationArrivalDataResponseModle: Decodable {
    var realtimeArrivalList: [RealTimeArrival] = []
    
    struct RealTimeArrival: Decodable {
        let line: String
        let remainTime: String
        let currentStation: String
        
        enum CodingKeys: String, CodingKey {
            case line = "trainLineNm"
            case remainTime = "arvlMsg2"
            case currentStation = "arvlMsg3"
        }
    }
}
