//
//  ViewController.swift
//  Choice
//
//  Created by User15 on 2018/12/4.
//  Copyright © 2018 Chia. All rights reserved.
//

import UIKit

struct QueStruct {
    var Que:String
    var choose:[String]=[]
    var ans:Int
    var selected:Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var But1: UIButton!
    @IBOutlet weak var But2: UIButton!
    @IBOutlet weak var But3: UIButton!
    @IBOutlet weak var But4: UIButton!
    @IBOutlet weak var QueNum: UILabel!
    @IBOutlet weak var Que: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Restart: UIButton!
    
    var count=1
    var point=0
    var QueArray:[QueStruct]=[]
    var randomQueArray:[QueStruct]=[]
    
    func allQuestion() {
        QueArray.append(QueStruct(Que:"排球場地之標準尺寸為多少呢？", choose:["9×16公尺","8×16公尺","9×18公尺","6×19公尺"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"排球攻擊區是在雙方網前？", choose:["三公尺","四公尺","五公尺","六公尺"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"球場五公分寬的白線是？：", choose:["包括在九公尺內","在九公尺外","各佔2.5公分","小屁孩的塗鴉"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"發球區的寬度為？", choose:["4公尺","2.5公尺","3.5公尺","9公尺"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"社會大專男子組網高為多少呢？", choose:["2.46公尺","2.44公尺","2.43公尺","2.42公尺"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"社會大專女子組網高為多少呢？", choose:["2.26公尺","2.25公尺","2.24公尺","2.22公尺"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"比賽如因故超過幾小時後,應重新比賽？", choose:["2小時","3小時","4小時","5小時"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"可以手掌觸球的基本動作是？", choose:["發球","攻擊","攔網","以上皆可"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"球隊最多不可超出多少人？", choose:["15人","10人","12人","16人"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"排球比賽中每隊人數不得少於多少人？", choose:["6人","7人","8人","9人"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"一般比賽裁判員至少有幾人？", choose:["1人","2人","3人","4人"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"一般比賽時,如果有司線員時,至少應有幾人？", choose:["1人","2人","3人","4人"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"在比賽中,如果要求裁判解釋時？", choose:["下場隊員皆可提出要求","只有隊長可以提出要求","要由教練提出","要由觀眾提出"], ans: 2, selected:false))
        QueArray.append(QueStruct(Que:"在比賽中要求暫停時,應由？", choose:["領隊提出","助理教練提出","教練提出","隊長提出"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"每隊每局最多有幾次替補機會？", choose:["3次","4次","5次","6次"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"比賽前選擇發球權或場地的責任是？", choose:["教練","助理教練","領隊","隊長"], ans: 4, selected:false))
        QueArray.append(QueStruct(Que:"賽前的正式練習由何隊先練習？", choose:["選擇發球權之球隊","選擇場地之球員","由裁判決定","一起練習"], ans: 1, selected:false))
        QueArray.append(QueStruct(Que:"前排球員站在左邊位置是？", choose:["2號","3號","4號","5號"], ans: 3, selected:false))
        QueArray.append(QueStruct(Que:"攔網觸球後,我方還有幾次擊球的權利？", choose:["0次","1次","2次","3次"], ans: 4, selected:false))
    }
    
    func ramdomNum()
    {
        while  randomQueArray.count<=10{
            
            let number = Int.random(in: 0...QueArray.count-1)
            if(QueArray[number].selected==false){
                randomQueArray.append(QueArray[number])
                QueArray[number].selected=true
            }
        }
        print(randomQueArray)
    }
    func getQuestion()
    {
        QueNum.text=String(count)
        Que.text=randomQueArray[count-1].Que
        But1.setTitle(randomQueArray[count-1].choose[0], for:UIControl.State.normal)
        But2.setTitle(randomQueArray[count-1].choose[1], for:UIControl.State.normal)
        But3.setTitle(randomQueArray[count-1].choose[2], for:UIControl.State.normal)
        But4.setTitle(randomQueArray[count-1].choose[3], for:UIControl.State.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allQuestion()
        ramdomNum()
        getQuestion()
        Restart.isEnabled=false
        Restart.isHidden=true
    }

    @IBAction func Choose(_ sender: UIButton) {
        if((sender==But1&&randomQueArray[count-1].ans==1)||(sender==But2&&randomQueArray[count-1].ans==2)||(sender==But3&&randomQueArray[count-1].ans==3)||(sender==But4&&randomQueArray[count-1].ans==4)) {
            point = point + 10
            Score.text=String(point)
        }
            count = count + 1
        if (count <= 10){
            getQuestion()
        }
        else{
            But1.isEnabled=false
            But2.isEnabled=false
            But3.isEnabled=false
            But4.isEnabled=false
            Restart.isEnabled=true
            Restart.isHidden=false
        }
    }
    
    @IBAction func RestartC(_ sender: UIButton) {
        
        for i in (0...QueArray.count-1) {
            QueArray[i].selected=false
        }
        randomQueArray.removeAll()
        ramdomNum()
        count=1
        getQuestion()
        point=0;
        Score.text=String(point)
        But1.isEnabled=true
        But2.isEnabled=true
        But3.isEnabled=true
        But4.isEnabled=true
        Restart.isEnabled=false
        Restart.isHidden=true
    }
}

