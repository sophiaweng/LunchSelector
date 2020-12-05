//
//  HomeViewController.swift
//  LunchSelector
//
//  Created by 翁淑惠 on 2020/11/23.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    let player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Draw
        let viewBowl = drawBowl()
        let viewSpoon = drawSpoon()
        viewBowl.transform = CGAffineTransform.identity.translatedBy(x: 30, y: 300).scaledBy(x: 10, y: 10)
        viewSpoon.transform = CGAffineTransform.identity.translatedBy(x: 30, y: 300).scaledBy(x: 10, y: 10)
        view.addSubview(viewBowl)
        view.addSubview(viewSpoon)
        
        let viewBowl1 = drawBowl()
        viewBowl1.transform = CGAffineTransform.identity.translatedBy(x: 45, y: 100).scaledBy(x: 2, y: 2).rotated(by: 0.5)
        view.addSubview(viewBowl1)
        let viewBowl2 = drawBowl()
        viewBowl2.transform = CGAffineTransform.identity.translatedBy(x: 190, y: 90).scaledBy(x: 2, y: 2).rotated(by: 2)
        view.addSubview(viewBowl2)
        let viewBowl3 = drawBowl()
        viewBowl3.transform = CGAffineTransform.identity.translatedBy(x: 250, y: 200).scaledBy(x: 2, y: 2).rotated(by: 3.5)
        view.addSubview(viewBowl3)
        let viewBowl4 = drawBowl()
        viewBowl4.transform = CGAffineTransform.identity.translatedBy(x: 280, y: 130).scaledBy(x: 2, y: 2).rotated(by: 5)
        view.addSubview(viewBowl4)
        
        let viewBowl5 = drawBowl()
        viewBowl5.transform = CGAffineTransform.identity.translatedBy(x: 45, y: 650).scaledBy(x: 2, y: 2).rotated(by: 0.5)
        view.addSubview(viewBowl5)
        let viewBowl6 = drawBowl()
        viewBowl6.transform = CGAffineTransform.identity.translatedBy(x: 190, y: 640).scaledBy(x: 2, y: 2).rotated(by: 2)
        view.addSubview(viewBowl6)
        let viewBowl7 = drawBowl()
        viewBowl7.transform = CGAffineTransform.identity.translatedBy(x: 250, y: 750).scaledBy(x: 2, y: 2).rotated(by: 3.5)
        view.addSubview(viewBowl7)
        let viewBowl8 = drawBowl()
        viewBowl8.transform = CGAffineTransform.identity.translatedBy(x: 280, y: 680).scaledBy(x: 2, y: 2).rotated(by: 5)
        view.addSubview(viewBowl8)
        
        //Gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            CGColor(red: 1, green: 204/255, blue: 204/255, alpha: 1),
            CGColor(red: 204/255, green: 204/255, blue: 1, alpha: 1),
            CGColor(red: 204/255, green: 204/255, blue: 153/255, alpha: 1)
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //Emiiter
        let whatToEatCell = CAEmitterCell()
        whatToEatCell.contents = UIImage(named: "whatToEatClean")?.cgImage
        whatToEatCell.birthRate = 2
        whatToEatCell.lifetime = 10
        whatToEatCell.velocity = 50
        whatToEatCell.yAcceleration = 20
        whatToEatCell.scale = 0.2
        whatToEatCell.spin = 1
        whatToEatCell.spinRange = 1
        whatToEatCell.emissionRange = CGFloat.pi * 2
        
        let whatToEatRain = CAEmitterLayer()
        whatToEatRain.emitterCells = [whatToEatCell]
        whatToEatRain.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        whatToEatRain.emitterSize = CGSize(width: view.bounds.width, height: 0)
        whatToEatRain.emitterShape = .circle
        view.backgroundColor = .clear
        view.layer.addSublayer(whatToEatRain)
        
        //BGM Player
        let fileUrl = Bundle.main.url(forResource: "bgMusic", withExtension: "mp3")
        let playerItem = AVPlayerItem(url: fileUrl!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    func drawBowl() -> UIView {
        let viewBowl = UIView()
        let layerBowl = CAShapeLayer()
        let pathBowl = UIBezierPath()
        
        pathBowl.move(to: CGPoint(x: 27, y: 17))
        pathBowl.addLine(to: CGPoint(x: 26.9, y: 17))
        pathBowl.addCurve(to: CGPoint(x: 23.9, y: 14.1), controlPoint1: CGPoint(x: 26.5, y: 15.6), controlPoint2: CGPoint(x: 25.4, y: 14.4))
        pathBowl.addCurve(to: CGPoint(x: 20, y: 11), controlPoint1: CGPoint(x: 23.5, y: 12.3), controlPoint2: CGPoint(x: 21.9, y: 11))
        pathBowl.addCurve(to: CGPoint(x: 18.8, y: 11.2), controlPoint1: CGPoint(x: 19.6, y: 11), controlPoint2: CGPoint(x: 19.2, y: 11.1))
        pathBowl.addCurve(to: CGPoint(x: 16, y: 10), controlPoint1: CGPoint(x: 18.1, y: 10.4), controlPoint2: CGPoint(x: 17.1, y: 10))
        pathBowl.addCurve(to: CGPoint(x: 13.2, y: 11.2), controlPoint1: CGPoint(x: 14.9, y: 10), controlPoint2: CGPoint(x: 13.9, y: 10.4))
        pathBowl.addCurve(to: CGPoint(x: 12, y: 11), controlPoint1: CGPoint(x: 12.8, y: 11.1), controlPoint2: CGPoint(x: 12.4, y: 11))
        pathBowl.addCurve(to: CGPoint(x: 8.1, y: 14.1), controlPoint1: CGPoint(x: 10.1, y: 11), controlPoint2: CGPoint(x: 8.5, y: 12.3))
        pathBowl.addCurve(to: CGPoint(x: 5.1, y: 17), controlPoint1: CGPoint(x: 6.7, y: 14.4), controlPoint2: CGPoint(x: 5.5, y: 15.6))
        pathBowl.addLine(to: CGPoint(x: 5, y: 17))
        pathBowl.addCurve(to: CGPoint(x: 4, y: 18), controlPoint1: CGPoint(x: 4.4, y: 17), controlPoint2: CGPoint(x: 4, y: 17.4))
        pathBowl.addLine(to: CGPoint(x: 4, y: 19))
        pathBowl.addCurve(to: CGPoint(x: 11, y: 29.9), controlPoint1: CGPoint(x: 4, y: 23.7), controlPoint2: CGPoint(x: 6.8, y: 28))
        pathBowl.addCurve(to: CGPoint(x: 11.4, y: 30), controlPoint1: CGPoint(x: 11.1, y: 30), controlPoint2: CGPoint(x: 11.3, y: 30))
        pathBowl.addLine(to: CGPoint(x: 20.5, y: 30))
        pathBowl.addCurve(to: CGPoint(x: 20.9, y: 29.9), controlPoint1: CGPoint(x: 20.6, y: 30), controlPoint2: CGPoint(x: 20.8, y: 30))
        pathBowl.addCurve(to: CGPoint(x: 27.9, y: 19), controlPoint1: CGPoint(x: 25.2, y: 28), controlPoint2: CGPoint(x: 27.9, y: 23.7))
        pathBowl.addLine(to: CGPoint(x: 27.9, y: 18))
        pathBowl.addCurve(to: CGPoint(x: 27, y: 17), controlPoint1: CGPoint(x: 28, y: 17.4), controlPoint2: CGPoint(x: 27.6, y: 17))
        pathBowl.close()
        pathBowl.move(to: CGPoint(x: 9, y: 16))
        pathBowl.addCurve(to: CGPoint(x: 10, y: 15), controlPoint1: CGPoint(x: 9.6, y: 16), controlPoint2: CGPoint(x: 10, y: 15.6))
        pathBowl.addCurve(to: CGPoint(x: 12, y: 13), controlPoint1: CGPoint(x: 10, y: 13.9), controlPoint2: CGPoint(x: 10.9, y: 13))
        pathBowl.addCurve(to: CGPoint(x: 13, y: 13.3), controlPoint1: CGPoint(x: 12.3, y: 13), controlPoint2: CGPoint(x: 12.7, y: 13.1))
        pathBowl.addCurve(to: CGPoint(x: 14.3, y: 13), controlPoint1: CGPoint(x: 13.5, y: 13.6), controlPoint2: CGPoint(x: 14.1, y: 13.4))
        pathBowl.addCurve(to: CGPoint(x: 16, y: 12.1), controlPoint1: CGPoint(x: 14.7, y: 12.4), controlPoint2: CGPoint(x: 15.3, y: 12.1))
        pathBowl.addCurve(to: CGPoint(x: 17.7, y: 13), controlPoint1: CGPoint(x: 16.7, y: 12.1), controlPoint2: CGPoint(x: 17.3, y: 12.4))
        pathBowl.addCurve(to: CGPoint(x: 19, y: 13.3), controlPoint1: CGPoint(x: 18, y: 13.5), controlPoint2: CGPoint(x: 18.6, y: 13.6))
        pathBowl.addCurve(to: CGPoint(x: 20, y: 13), controlPoint1: CGPoint(x: 19.3, y: 13.1), controlPoint2: CGPoint(x: 19.6, y: 13))
        pathBowl.addCurve(to: CGPoint(x: 22, y: 15), controlPoint1: CGPoint(x: 21.1, y: 13), controlPoint2: CGPoint(x: 22, y: 13.9))
        pathBowl.addCurve(to: CGPoint(x: 23, y: 16), controlPoint1: CGPoint(x: 22, y: 15.6), controlPoint2: CGPoint(x: 22.4, y: 16))
        pathBowl.addCurve(to: CGPoint(x: 24.7, y: 17), controlPoint1: CGPoint(x: 23.7, y: 16), controlPoint2: CGPoint(x: 24.4, y: 16.4))
        pathBowl.addLine(to: CGPoint(x: 7.3, y: 17))
        pathBowl.addCurve(to: CGPoint(x: 9, y: 16), controlPoint1: CGPoint(x: 7.6, y: 16.4), controlPoint2: CGPoint(x: 8.3, y: 16))
        pathBowl.close()
        
        layerBowl.path = pathBowl.cgPath
        viewBowl.layer.addSublayer(layerBowl)
        //shake(layer: layerBowl)
        
        return viewBowl
    }
    
    func drawSpoon() -> UIView {
        let viewSpoon = UIView()
        let layerSpoon = CAShapeLayer()
        let pathSpoon = UIBezierPath()
        
        pathSpoon.move(to: CGPoint(x: 9, y: 10))
        pathSpoon.addCurve(to: CGPoint(x: 13.3, y: 8.1), controlPoint1: CGPoint(x: 10.8, y: 10), controlPoint2: CGPoint(x: 12.4, y: 9.3))
        pathSpoon.addLine(to: CGPoint(x: 25, y: 8.9))
        pathSpoon.addCurve(to: CGPoint(x: 27.2, y: 8.1), controlPoint1: CGPoint(x: 25.8, y: 9), controlPoint2: CGPoint(x: 26.6, y: 8.7))
        pathSpoon.addCurve(to: CGPoint(x: 28, y: 6), controlPoint1: CGPoint(x: 27.7, y: 7.6), controlPoint2: CGPoint(x: 28, y: 6.8))
        pathSpoon.addCurve(to: CGPoint(x: 27.1, y: 3.9), controlPoint1: CGPoint(x: 28, y: 5.2), controlPoint2: CGPoint(x: 27.7, y: 4.4))
        pathSpoon.addCurve(to: CGPoint(x: 24.9, y: 3.1), controlPoint1: CGPoint(x: 26.5, y: 3.4), controlPoint2: CGPoint(x: 25.8, y: 3.1))
        pathSpoon.addLine(to: CGPoint(x: 13.3, y: 3.9))
        pathSpoon.addCurve(to: CGPoint(x: 9, y: 2), controlPoint1: CGPoint(x: 12.4, y: 2.7), controlPoint2: CGPoint(x: 10.8, y: 2))
        pathSpoon.addCurve(to: CGPoint(x: 4, y: 6), controlPoint1: CGPoint(x: 6.2, y: 2), controlPoint2: CGPoint(x: 4, y: 3.8))
        pathSpoon.addCurve(to: CGPoint(x: 9, y: 10), controlPoint1: CGPoint(x: 4, y: 8.2), controlPoint2: CGPoint(x: 6.2, y: 10))
        pathSpoon.close()
        
        layerSpoon.path = pathSpoon.cgPath
        viewSpoon.layer.addSublayer(layerSpoon)
        shake(layer: layerSpoon)
        
        return viewSpoon
    }
    
    func shake(layer: CAShapeLayer) {
        let shake = CABasicAnimation(keyPath: "transform.rotation.z")
        shake.fromValue = -0.2
        shake.toValue = 0
        shake.duration = 0.3
        shake.autoreverses = true
        shake.repeatCount = .infinity
        layer.add(shake, forKey: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
