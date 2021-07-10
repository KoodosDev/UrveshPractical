//
//  UserModel.swift
//  TwitterDemoUrveshMishra
//
//  Created by iMac on 10/07/21.
//  Copyright © 2021 iMac. All rights reserved.
//

import Foundation

//Model to save the user data in model form
struct UserModel:Decodable {
    
    // Variable for saving user details,
    // Using Optional so that if there is no value in some case it can contain null value
    
    var user_name : String?
    var user_image : String?
    var user_follower : Int?
    var user_following : Int?
    
    init(user_name: String?,user_image: String?,user_follower: Int?,user_following: Int?) {
        self.user_name = user_name
        self.user_image = user_image
        self.user_follower = user_follower
        self.user_following = user_following
        
    }
}
