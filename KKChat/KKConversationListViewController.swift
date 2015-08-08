//
//  KKConversationListViewController.swift
//  KKChat
//
//  Created by jensen on 15/8/6.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

import UIKit

class KKConversationListViewController: RCConversationListViewController {
    
    let conVC = RCConversationViewController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }

    @IBAction func showMenu(sender: UIBarButtonItem) {
//        var frame = sender.valueForKey("view")?.frame
//        frame?.origin.y  = (frame?.origin.y)! + 30
//        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
//            KxMenuItem("客服", image: nil, target: self, action: "clickMenu1"),
//            KxMenuItem("好友", image: nil, target: self, action: "clickMenu2")
//            ])
        
        let items = [
            MenuItem(title: "客服", iconName: nil, glowColor: UIColor.redColor(), index: 0),
            MenuItem(title: "好友", iconName: "default_discussion_portrait", glowColor: UIColor.blueColor(), index: 1),
            MenuItem(title: "通讯录", iconName: nil, glowColor: UIColor.yellowColor(), index: 2),
            MenuItem(title: "关于", iconName: "public_serive_menu_icon", glowColor: UIColor.orangeColor(), index: 3)
        ]
        
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.menuAnimationType = PopMenuAnimationType.NetEase
        if menu.isShowed {
            
        }
        menu.didSelectedItemCompletion = { (selectedItem: MenuItem!) -> Void in
            switch selectedItem.index {
            case 1:
                self.clickMenu2()
            default:
                print(selectedItem.title)
                
            }
        }
        menu.showMenuAtView(self.view)
    }
    
    func clickMenu1() {
        print("与客服聊天")
    }
    
    func clickMenu2() {
        print("与好友聊天")
        let conVC = RCConversationViewController()
        conVC.targetId = "kellen"
        conVC.userName = "shen"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = "与\(conVC.userName)聊天"
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.pushViewController(conVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appDelegate?.connectServer({ () -> Void in
            print("连接成功2")
            //OC枚举和swift枚举不同
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        })
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
//        let conVC = RCConversationViewController()
//        conVC.targetId = model.targetId
//        conVC.userName = model.conversationTitle
//        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
//        conVC.title = model.conversationTitle
//        self.tabBarController?.tabBar.hidden = true
//        self.navigationController?.pushViewController(conVC, animated: true)
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        self.performSegueWithIdentifier("tapOnCell", sender: self)
    }
    //转场
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let descVC = segue.destinationViewController as? RCConversationViewController
        descVC?.targetId = conVC.targetId
        descVC?.userName = conVC.userName
        descVC?.conversationType = conVC.conversationType
        descVC?.title = conVC.title
        
        self.tabBarController?.tabBar.hidden = true
    }
    

}
