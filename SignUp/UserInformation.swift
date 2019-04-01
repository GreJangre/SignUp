//
//  UserInformation.swift
//  SignUp
//
//  Created by 임성주 on 31/03/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import Foundation

class UserInformation {
    static let sharedInstance: UserInformation = UserInformation()
    
    var id: String?
    var phoneNumber: String?
    var date: Date?
}
