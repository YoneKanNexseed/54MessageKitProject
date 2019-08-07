//
//  ViewController.swift
//  MessageKitProject
//
//  Created by yonekan on 2019/08/05.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

// UIViewControllerからMessagesViewControllerに変更することによって、チャット画面を作成するために使える便利な機能を使用できるようになります。
class ViewController: MessagesViewController {

    // 全メッセージを保持する配列
    var messageList: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
    }

}

extension ViewController: MessagesDataSource {
    
    // 自分の情報
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "SeedKun"
        return ChatUser(senderId: id, displayName: name)
    }
    
    // 表示するメッセージの情報
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        
        return messageList[indexPath.section]
    }
    
    // メッセージの件数
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
}

// 送信ボタンの処理
extension ViewController: InputBarAccessoryViewDelegate {
    
    // 送信ボタンがクリックされた時の処理
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        // 送信者の作成（自分の情報を取得）
        let me = self.currentSender() as! ChatUser
        
        // メッセージ作成
        let message = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        
        messageList.append(message)
        
        // 作成したメッセージを画面に追加
        messagesCollectionView.insertSections([messageList.count - 1])
        
        // 入力バーのリセット
        inputBar.inputTextView.text = ""
        
        // 返信を作成
        let other = ChatUser(senderId: "9999", displayName: "UserName")
        
        var replyMessage: Message
        
        if text == "こんにちは" {
            replyMessage = Message(user: other, text: "押忍", messageId: UUID().uuidString, sentDate: Date())
        } else {
            replyMessage = Message(user: other, text: "よくわかりません", messageId: UUID().uuidString, sentDate: Date())
        }
        
        messageList.append(replyMessage)
        
        messagesCollectionView.insertSections([messageList.count - 1])
    }
    
}

extension ViewController: MessagesDisplayDelegate {
    
}

extension ViewController: MessagesLayoutDelegate {
    
}
