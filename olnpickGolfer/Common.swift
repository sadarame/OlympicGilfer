//
//  Common.swift
//  olnpickGolfer
//
//  Created by Yosuke Yoshida on 2021/05/09.
//

import Foundation

func changeDateToString(date:Date) -> String {
    let f = DateFormatter()
    f.timeStyle = .medium
    f.dateStyle = .medium
    f.locale = Locale(identifier: "ja_JP")
    return f.string(from: date)
    
}
