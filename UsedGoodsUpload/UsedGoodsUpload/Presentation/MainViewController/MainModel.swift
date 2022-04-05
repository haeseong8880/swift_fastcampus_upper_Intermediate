//
//  MainModel.swift
//  UsedGoodsUpload
//
//  Created by haeseongJung on 2022/04/05.
//

import Foundation

struct MainModel {
    func setAlert(errorMessages: [String]) -> (title: String, message: String?) {
        let title = errorMessages.isEmpty ? "성공": "실패"
        let message = errorMessages.isEmpty ? nil : errorMessages.joined(separator: "\n")
        return (title: title, message: message)
    }
}
