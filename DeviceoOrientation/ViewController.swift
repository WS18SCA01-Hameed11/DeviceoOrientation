//
//  ViewController.swift
//  DeviceoOrientation
//
//  Created by Hameed Abdullah on 12/12/18.
//  Copyright © 2018 Hameed Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let names: [Orientation] = [
        Orientation(name: "unknown", color: .black),
        Orientation(name: "portrait", color: .red),
        Orientation(name: "portraitUpsideDown", color: .green),
        Orientation(name: "landscapeLeft", color: .blue),
        Orientation(name: "landscapeRight", color: .orange),
        Orientation(name: "faceUp", color: .gray),
        Orientation(name: "faceDown", color: .darkGray)
        
    ]
    
//    let names: [String] = [   //Pull down Hardware -> Orientation
//        "unknown",            //0
//        "portrait",           //1 home button at bottom
//        "portraitUpsideDown", //2 home button at top
//        "landscapeLeft",      //3 home button on right
//        "landscapeRight",     //4 home button on left
//        "faceUp",             //5 screen facing upwards
//        "faceDown",           //6 screen facing downwards
//    ];
    
    let colors: [UIColor] = [.red, .black, .gray, .green, .blue, .orange, .darkGray]
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)

    }
    

    
    @objc func orientationDidChange() {
        
        currentIndex += 1
        updateUI()

    }
    
    func updateUI() {
        //currentIndex %= colors.count;
        
        if currentIndex == names.count {
            currentIndex = 0
        }
        
        label.text = names[UIDevice.current.orientation.rawValue].name
        view.backgroundColor = names[currentIndex].color
    }

    
}












