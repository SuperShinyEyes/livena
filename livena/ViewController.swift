//
//  ViewController.swift
//  livena
//
//  Created by Park Seyoung on 21/10/16.
//  Copyright © 2016 Park Seyoung. All rights reserved.
//

import UIKit
import AVFoundation

struct Constants {
    struct StreamURLs {
        static let sample = "http://areenahdworld-vh.akamaihd.net/i/world/d4/d4d8c3abb65754e7e1dc8bd369dcb772_,153600,395264,663552,1016832,2643968,.mp4.csmil/master.m3u8?hdnea=st=1477050714~exp=1477051014~acl=/i/world/d4/d4d8c3abb65754e7e1dc8bd369dcb772_*~hmac=6496eb483125f2f2a0bee8becad1ec03f56191b53b544af4a13efd5bc533f5c2"
        static let sample2 = "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"
    }
}

class VideoPlayerViewController: UIViewController {
    let avPlayer = AVPlayer()
    var avPlayerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // An AVPlayerLayer is a CALayer instance to which the AVPlayer can
        // direct its visual output. Without it, the user will see nothing.
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        print("Insert subplayer")
        
        let url = URL(string: Constants.StreamURLs.sample2)
        let playerItem = AVPlayerItem(url: url!)
        print("status: \(playerItem.status.rawValue)")
        avPlayer.replaceCurrentItem(with: playerItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avPlayer.play() // Start the playback
        print("Play \tStatus: \(avPlayer.currentItem?.status.rawValue)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Layout subviews manually
        avPlayerLayer.frame = view.bounds
    }
    
    // Force the view into landscape mode (which is how most video media is consumed.)
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
}
