//
//  SvetoforViewController.swift
//  Svetofor
//
//  Created by Андрей Дорогой on 23.10.2023.
//

import UIKit

class SvetoforViewController: UIViewController {

  
    @IBOutlet weak var lightBody: UIView!
    @IBOutlet weak var redRing: UIView!
    @IBOutlet weak var yellowRing: UIView!
    @IBOutlet weak var greenRing: UIView!
    @IBOutlet weak var redLight: UIImageView!
    @IBOutlet weak var yellowLight: UIImageView!
    @IBOutlet weak var greenLight: UIImageView!
    @IBOutlet weak var flash: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    private var timer: Timer?
    private var timerFlash: Timer?
//    private var updateTimer: (Int) -> Void
    private var check: Int = 0
    private var yellowTime: Int = 2
    private var timeGreenLight: Int = Settings.share.currentSettings.timeForGreen
    private var timeRedLight: Int = Settings.share.currentSettings.timeForRed
    private var secondsLight: Int = 5 {
        didSet {
            if secondsLight == 0 {
                timer?.invalidate()
            }
        }
    }
    
//    init (secondsLight: Int, updateTimer: @escaping (Int) -> Void) {
//        self.secondsLight = secondsLight
//        self.updateTimer = updateTimer
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopLight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightBody.layer.cornerRadius = 90
        lightBody.layer.borderWidth = 20
        lightBody.layer.borderColor = UIColor.black.cgColor
        
        configRing(view: redRing)
        configRing(view: yellowRing)
        configRing(view: greenRing)
        
        configLight(view: redLight)
        configLight(view: yellowLight)
        configLight(view: greenLight)
        
        redLight.alpha = 0
        yellowLight.alpha = 0
        greenLight.alpha = 0
        
//        changeLight()
        time()
    }
    
    
    
    @IBAction func flashButton(_ sender: Any) {
        if timeLabel.isHidden == false {
            yellowFlash()
            self.timeLabel.isHidden = true
        } else {
            yellowLight.alpha = 0
            self.timeLabel.isHidden = false
            time()
//            changeLight()
        }
//        if yellowLight.alpha == 0 {
//            yellowLight.alpha = 1
//        } else {
//            yellowLight.alpha = 0
//        }
    }
    
//    MARK: - Private
    
    private func configLight(view: UIImageView) {
        view.layer.cornerRadius = redLight.frame.width / 2
        view.layer.borderWidth = 8
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    private func configRing (view: UIView) {
        view.layer.cornerRadius = redRing.frame.width / 2
        view.layer.borderWidth = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .darkGray
    }
    
    func yellowFlash() {
        timer?.invalidate()
        timerFlash?.invalidate()
        redLight.alpha = 0
        greenLight.alpha = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in ()
            if self.yellowLight.alpha == 0 {
                self.yellowLight.alpha = 1
            } else {
                self.yellowLight.alpha = 0
            }
        })
    }
    
    func time() {
       
        redLight.alpha = 1
        yellowLight.alpha = 0
        greenLight.alpha = 0
        changeRedLight()
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in ()
//            self.secondsLight -= 1
//            self.timeLabel.text = self.secondsLight.secString()
//        })
    }
    
    func changeRedLight() {
        red()
        print("red")
        timer?.invalidate()
        timeLabel.text = secondsLight.secString()
        timeLabel.textColor = .red
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in ()
            self.secondsLight -= 1
            self.timeLabel.text = self.secondsLight.secString()
            if self.secondsLight == 3 {
                self.yellowLight.alpha = 1
            }
            if self.secondsLight == 0 {
                self.changeGreenLight()
            }
        })
        
    }
    
    func changeGreenLight() {
        green()
        print ("green")
        timer?.invalidate()
        timeLabel.text = secondsLight.secString()
        timeLabel.textColor = .green
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in ()
            self.secondsLight -= 1
            self.timeLabel.text = self.secondsLight.secString()
            if self.secondsLight == 3 {
                self.timerFlash = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in ()
                    if self.greenLight.alpha == 1 && self.timeLabel.alpha == 1{
                        self.greenLight.alpha = 0
                        self.timeLabel.alpha = 0
                    } else {
                        self.greenLight.alpha = 1
                        self.timeLabel.alpha = 1
                    }
                })
            }
            if self.secondsLight == 0 {
                self.timerFlash?.invalidate()
                self.changeYellowLight()
            }
        })
        
    }
    
    func changeYellowLight() {
        yellow()
        print ("yellow")
        timer?.invalidate()
        timeLabel.text = secondsLight.secString()
        timeLabel.textColor = .black
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in ()
            self.secondsLight -= 1
            self.timeLabel.text = self.secondsLight.secString()
            if self.secondsLight == 0 {
                self.timer?.invalidate()
                self.changeRedLight()
            }
        })
    }
            
    
         
    
    func red() {
        self.timer?.invalidate()
        self.secondsLight = self.timeRedLight
        self.timeLabel.alpha = 1
        self.redLight.alpha = 1
        self.yellowLight.alpha = 0
        self.greenLight.alpha = 0
    }
    
    func green() {
        self.timer?.invalidate()
        self.secondsLight = self.timeGreenLight
        self.redLight.alpha = 0
        self.yellowLight.alpha = 0
        self.greenLight.alpha = 1
    }

    func yellow() {
        self.timer?.invalidate()
        self.secondsLight = self.yellowTime
        self.redLight.alpha = 0
        self.yellowLight.alpha = 1
        self.greenLight.alpha = 0
    }
    
    func stopLight() {
        timer?.invalidate()
    }
            
//    func timePeriod() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in ()
//            self.secondsLight -= 1
//            self.timeLabel.text = self.secondsLight.secString()
//        })
//    }
}

extension Int {
//    func secondsString() -> String {
//        let minute = self / 60
//        let second = self % 60
//        return String (format: "%d:%02d", minute, second)
//    }
    
    func secString() -> String {
        let second = self % 60
        return String (format: "%02d", second)
    }
}
