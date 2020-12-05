//
//  SelectorViewController.swift
//  LunchSelector
//
//  Created by 翁淑惠 on 2020/11/23.
//

import UIKit
import SpriteKit

class LunchViewController: UIViewController {
    
    @IBOutlet weak var typeSegment: UISegmentedControl!
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var keywordText: UITextField!
    @IBOutlet weak var lunchImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lunchImg.image = UIImage(systemName: "questionmark.square.dashed")
        
        //Sprite
        let skView = SKView(frame: view.frame)
        let skScene = SKScene(size: skView.frame.size)
        let skEmitterNode = SKEmitterNode(fileNamed: "IconParticle")
        skScene.anchorPoint = CGPoint(x: 0.5, y: 1)
        skScene.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 204/255, blue: 204/255, alpha: 1))
        skScene.addChild(skEmitterNode!)
        skView.presentScene(skScene)
        view.insertSubview(skView, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard(UITextField())
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        self.view.endEditing(true)
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        //Fix interval 50
        sender.setValue((sender.value / 50).rounded() * 50, animated: true)
        priceLabel.text = String(Int(sender.value))
        if sender.value > 150 {
            priceLabel.textColor = .systemRed
        } else {
            priceLabel.textColor = .systemGreen
        }
    }
    
    @IBAction func randomGo(_ sender: Any) {
        let imageAry = getLunchItems()
        let index = Int.random(in: 0...imageAry.count-1)
        pickLunch(imgName: imageAry[index].name)
    }
    
    @IBAction func selectGo(_ sender: Any) {
        let imageAry = getLunchItems()
        
        pickLunch(imgName: "notFound")
        
        for element in imageAry {
            //keyword
            if element.type == typeSegment.selectedSegmentIndex,
               element.light == lightSwitch.isOn,
               element.price == Int(priceSlider.value),
               (element.name.contains(keywordText.text!) || keywordText.text! == "")
                {
                pickLunch(imgName: element.name)
                break
            }
        }
        
    }
    
    
    func pickLunch(imgName: String) {
        lunchImg.image = UIImage(named: imgName)
    }
    
    func getLunchItems() -> Array<LunchItem> {
        let imageAry = [
            LunchItem(name: "中式_乾麵", type: 0, light: true, price: 50),
            LunchItem(name: "中式_滷肉飯", type: 0, light: true, price: 100),
            LunchItem(name: "中式_便當", type: 0, light: false, price: 150),
            LunchItem(name: "中式_自助餐", type: 0, light: false, price: 200),
            LunchItem(name: "中式_牛肉麵", type: 0, light: false, price: 250),
            LunchItem(name: "西式_三明治", type: 1, light: true, price: 50),
            LunchItem(name: "西式_沙拉", type: 1, light: true, price: 100),
            LunchItem(name: "西式_速食套餐", type: 1, light: false, price: 150),
            LunchItem(name: "西式_義大利麵", type: 1, light: false, price: 200),
            LunchItem(name: "西式_披薩", type: 1, light: false, price: 250),
            LunchItem(name: "日式_御飯糰", type: 2, light: true, price: 50),
            LunchItem(name: "日式_關東煮", type: 2, light: true, price: 100),
            LunchItem(name: "日式_壽司", type: 2, light: true, price: 150),
            LunchItem(name: "日式_烏龍麵", type: 2, light: false, price: 200),
            LunchItem(name: "日式_咖哩飯", type: 2, light: false, price: 250),
            LunchItem(name: "謎式_泡麵", type: 3, light: false, price: 50),
            LunchItem(name: "謎式_麵包", type: 3, light: true, price: 100),
            LunchItem(name: "謎式_微波食品", type: 3, light: false, price: 150),
            LunchItem(name: "謎式_蔬食料理", type: 3, light: true, price: 200),
            LunchItem(name: "謎式_小火鍋", type: 3, light: false, price: 250)
        ]
        return imageAry
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
