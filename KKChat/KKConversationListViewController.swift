//
//  KKConversationListViewController.swift
//  KKChat
//
//  Created by jensen on 15/8/6.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

import UIKit

class KKConversationListViewController: RCConversationListViewController {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController?.tabBar.hidden = true
    }
    

}
