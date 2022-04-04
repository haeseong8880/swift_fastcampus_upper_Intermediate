//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by haeseongJung on 2022/04/04.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
