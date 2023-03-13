//
//  ViewController.swift
//  LEDBoard
//
//  Created by Miah Lee on 2023/03/13.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }

    // Segueway로 화면 전환을 구현했기 때문에 prepare 메소드를 오버라이드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        // 초기화
        if let text = text {
            self.contentsLabel.text = text
        }
        // 값 전달
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}

