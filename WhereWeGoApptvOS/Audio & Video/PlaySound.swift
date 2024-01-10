//
//  PlaySound.swift
//  WhereWeGoApptvOS
//
//  Created by fonztara on 18/07/22.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound(key: String) {
    let url = Bundle.main.url(forResource: key, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player.play()
    } catch {
        print("error")
    }
    
}
