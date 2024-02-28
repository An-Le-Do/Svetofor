//
//  SvetoforSectionsView.swift
//  Svetofor
//
//  Created by Андрей Дорогой on 23.10.2023.
//

//import UIKit
////import SnapKit
//
//enum Colors {
//    case red
//    case yellow
//    case green
//    
//    func color() -> UIColor {
//        switch self {
//        case .red:
//            return .red
//        case .yellow:
//            return .yellow
//        case .green:
//            return .green
//        }
//    }
//}
//
//class SvetoforSectionsView: UIView {
//    
//    var colorLight: Colors?
//    
////    init(colorLight: Colors? = nil) {
////        super.init(frame: .zero)
////        self.colorLight = colorLight
////    }
////    
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
////        setupLight()
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
////        setupLight()
//    }
//    
////    MARK: - Public
//    
//    func turnOn() {
//        backgroundColor = colorLight?.color()
//    }
//    
//    func turnOff() {
//        backgroundColor = .clear
//    }
//    
//    func isOn() -> Bool {
//        if backgroundColor == .clear {
//            return false
//        } else {
//            return true
//        }
//    }
//    
//    func isOff() -> Bool {
//        if backgroundColor == .clear {
//            return true
//        } else {
//            return false
//        }
//    }
//    
////    MARK: - Private
//    
////    private func setupLight() {
////        self.layer.cornerRadius = frame.size.height / 2
////        self.layer.borderWidth = 10
////        self.layer.borderColor = UIColor.black.cgColor
////        self.backgroundColor = .clear
////    }
//    
//}
