//
//  File.swift
//  
//
//  Created by 변경민 on 2020/12/23.
//

import Foundation

extension String {
    func isContainSpaceAndNewlines() -> Bool {
        return rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }
}
