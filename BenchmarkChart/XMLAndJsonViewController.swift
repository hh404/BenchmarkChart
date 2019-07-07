//
//  XMLAndJsonViewController.swift
//  BenchmarkChart
//
//  Created by huangjianwu on 2019/7/7.
//  Copyright © 2019 huangjianwu. All rights reserved.
//

import UIKit

//用户对象
struct User {
    var id: String?  //编号
    var name: String? //姓名
    var mobile: String? //手机
    var home: String?  //固话
}

class XMLAndJsonViewController: UIViewController {

    //保存最终解析的结果
    var xmlUsers:[User] = []
    
    //当前元素名
    var currentXmlElement = ""
    
    //当前用户
    var xmlUser:[String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.measureXml()
        
    }
    
    func measureXml() {
        //获取xml文件路径
        let file = Bundle.main.path(forResource: "users1", ofType: "xml")
        //初始化parser
        let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: file!) as URL)!
        //设置delegate
        parser.delegate = self
        //开始解析
        parser.parse()
        //输出结果
        for i in 0...(xmlUsers.count - 1 ){
            print("User: id:\(xmlUsers[i].id!)，name:\(xmlUsers[i].name!)，"
                + "mobile:\(xmlUsers[i].mobile!)，home:\(xmlUsers[i].home!)")
        }
    }
    
    func measureJson() {
        
    }

}


extension XMLAndJsonViewController: XMLParserDelegate {
    
    // 遇到一个开始标签时调用
    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        currentXmlElement = elementName
        //当elementName是 "User"时，表示开始解析一个新用户了
        if elementName == "User"{
            //创建一个新用户对象
           // xmlUser = User()
            //保存下id
            //xmlUser["id"] =
            //xmlUser.id = attributeDict["id"]
        }
    }
    
    // 遇到字符串时调用
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: .whitespacesAndNewlines)
        //接下来每遇到一个字符，将该字符追加到相应的 property 中
//        switch currentXmlElement{
//        case "name":
//            //xmlUser.name = xmlUser.name ?? "" + data
//        case "mobile":
//           // xmlUser.mobile = xmlUser.mobile ?? "" +  data
//        case "home":
//            //xmlUser.home = xmlUser.home ?? "" + data
//        default:
//            break
//        }
    }
    
    // 遇到结束标签时调用
    func parser(_ parser: XMLParser, didEndElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?) {
        //标签User结束时将该用户对象，存入数组容器。
        if elementName == "User"{
            //xmlUsers.append(xmlUser)
        }
    }
}
