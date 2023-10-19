//
//  gasStationModel.swift
//  ExamPrac2_Waobikeze_Brian
//
//  Created by brian waobikeze on 10/18/23.
//

import Foundation

struct GasStation: Codable{
    var station: String
    var logo:URL?
    var reg: Double
    var mid: Double
    var prem: Double
    var dies: Double
    var gas_latitude: Double
    var gas_longitude: Double
    
    func price(for version: String) -> Double {
        switch version {
        case "Regular":
            return reg
        case "Midgrade":
            return mid
        case "Premium":
            return prem
        case "Diesel":
            return dies
        default:
            return 0.0
        }
    }
}
