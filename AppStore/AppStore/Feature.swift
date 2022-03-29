//
//  Feature.swift
//  AppStore
//
//  Created by haeseongJung on 2022/03/29.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName:  String
    let description: String
    let imageURL: String
}
