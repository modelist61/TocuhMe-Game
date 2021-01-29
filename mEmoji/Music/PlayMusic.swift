//
//  PlayMusic.swift
//  mEmoji
//
//  Created by Dmitry Tokarev on 25.01.2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error")
        }
    }
}

func stopSound() {
    audioPlayer = AVAudioPlayer()
    audioPlayer?.stop()
        
    }
