//
//  KKConversationController.swift
//  KKChat
//
//  Created by jensen on 15/8/5.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

import UIKit

class KKConversationController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = RCIMClient.sharedRCIMClient().currentUserInfo
        
        self.targetId = currentUser.userId
        self.userName = currentUser.name
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        
        self.title = self.userName
        
        self.setMessageAvatarStyle(RCUserAvatarStyle._USER_AVATAR_CYCLE)
        
        
    }

   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
