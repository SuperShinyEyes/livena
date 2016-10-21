//
//  ViewController.swift
//  livena
//
//  Created by Park Seyoung on 21/10/16.
//  Copyright © 2016 Park Seyoung. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct Constants {
    struct StreamURLs {
        static let sample = "http://areenahdworld-vh.akamaihd.net/i/world/d4/d4d8c3abb65754e7e1dc8bd369dcb772_,153600,395264,663552,1016832,2643968,.mp4.csmil/master.m3u8?hdnea=st=1477050714~exp=1477051014~acl=/i/world/d4/d4d8c3abb65754e7e1dc8bd369dcb772_*~hmac=6496eb483125f2f2a0bee8becad1ec03f56191b53b544af4a13efd5bc533f5c2"
        static let sample2 = "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8"
    }
}

class StreamPlayerViewController: UIViewController {
    
    var avPlayerVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        loadStream(urlAsString: Constants.StreamURLs.sample2, avPlayerVC: avPlayerVC)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let player = avPlayerVC.player {
            player.play()
            print("ready: \(avPlayerVC.isReadyForDisplay)")
        } else {
            print("no player")
        }
    }
    
    // Force the view into landscape mode (which is how most video media is consumed.)
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
}

extension StreamPlayerViewController {
    fileprivate func loadStream(urlAsString: String, avPlayerVC: AVPlayerViewController) {
        guard let url = URL(string: urlAsString) else { print("Invalid URL: \(urlAsString)");return }
        
        avPlayerVC.player = AVPlayer(url: url)
        avPlayerVC.view.frame = view.bounds
        view.addSubview(avPlayerVC.view)
    }
}
