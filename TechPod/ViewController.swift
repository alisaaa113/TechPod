//
//  ViewController.swift
//  TechPod
//
//  Created by arisa isshiki on 2018/02/07.
//  Copyright © 2018年 alisa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //storyboadで扱うtableview宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイルを入れるための配列
    var fileNameArray = [String]()
    //音楽家の画像入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //テーブルビューのデータソースメゾットはViewControllerクラスに書くよ という設定
        table.dataSource = self
        //テーブルビューのデリーゲートメゾットはViewControllerメゾットに書くよ という設定
        table.delegate = self
    
        //songNameArrayに曲名を入れる
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon","elise","aria"]
        
        //imageNameArrayに曲の画像の名前を入れていく
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //セルの数設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    //セルの数をsongNameArrayの数にする
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」を表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示する
        cell?.textLabel?.text = songNameArray[indexPath.row]
        //セルに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //セルが押された時に呼ばれるメゾット
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました!")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row],ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }

}

