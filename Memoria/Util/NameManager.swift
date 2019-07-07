//
//  NameManager.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/06/30.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation

struct NameManager {
    /// 名字・名前・ミドルネームを受け取って、フルネームを返す
    static func getFullName(isFamilyNameFirst: Bool, familyName: String?, givenName: String?) -> String {

        if isFamilyNameFirst {
            guard let familyName = familyName else { return givenName! }
            guard let givenName = givenName else { return familyName }
            return familyName + " " + givenName
            
        } else { // GivenNameFirst
            guard let familyName = familyName else { return givenName! }
            guard let givenName = givenName else { return familyName }
            return givenName + " " + familyName
        }
    }
}

//case using middleName
//
//var fullName = ""
//if isFamilyNameFirst {
//    fullName.append(familyName ?? "")
//    if let middleName = middleName {
//        if familyName != nil { fullName.append(" ")}
//        fullName.append(middleName)
//    }
//    if let givenName = givenName {
//        if familyName != nil || middleName != nil { fullName.append(" ")}
//        fullName.append(givenName)
//    }
//    return fullName
//
//} else {
//    fullName.append(givenName ?? "")
//    if let middleName = middleName {
//        if givenName != nil { fullName.append(" ")}
//        fullName.append(middleName)
//    }
//    if let familyName = familyName {
//        if givenName != nil || middleName != nil { fullName.append(" ")}
//        fullName.append(familyName)
//    }
//    return fullName
//}
//
