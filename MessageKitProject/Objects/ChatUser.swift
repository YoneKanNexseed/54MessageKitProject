//
//  ChatUser.swift
//  MessageKitProject
//
//  Created by yonekan on 2019/08/05.
//  Copyright © 2019 yonekan. All rights reserved.
//
import MessageKit

class ChatUser: SenderType {
    
    // ユーザーID
    var senderId: String
    
    // 表示名
    var displayName: String
    
    // コンストラクタ（クラスをインスタンス化する時に呼ばれるもの）
    // ChatUserを作るときは、必ずユーザーIDと表示名を設定するようにする
    init(senderId: String, displayName: String) {
        self.senderId = senderId
        self.displayName = displayName
    }
}
