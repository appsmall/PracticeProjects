//
//  ProdDetail_VC3.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 19/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import UIKit

class ProdDetail_VC3: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource
    //, UITableViewDataSource,UITableViewDelegate, ExpandableHeaderViewDelegate
{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imgProd: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblProdName: UILabel!
    @IBOutlet weak var lblProdPrc: UILabel!
    @IBOutlet weak var lblMRPrc: UILabel!
    
    var arrProdSize: [String] = []
    //var arrProdPrc: [String] = []
    var strProdName: String!
    var strProdPrc: String!
    var strMRPrc: String!
    
    var sections = [Section(title:"Discounts and Cashbacks", desc:["Bank OfferExtra 5% off* with Axis Bank Buzz Credit Card","Special Price: Get extra 10% off (price inclusive of discount)"],expanded: false), Section(title:"Product Description", desc: ["Basket arrangement of 15 Red Roses, Draceane leaves and Seasonal Filler","Here is a bunch of gorgeous premium long-stem red roses, hand-crafted in a basket.", "You can make your order from Ferns N Petals to get the flower arrangement delivered to your loved ones.","The basket is arranged with 15 red roses with green dracaena leaves and seasonal filler."],expanded: false), Section(title:"Instructions", desc:["When your flowers arrive, just trim the stems and add water. Re-cut 1-2” of the stems at a 45 degree angle.","Use a clean vase and clean water.", "Check the water level daily and replenish as needed.", "Don’t place flowers in direct sunlight or near any other source of excessive heat."],expanded: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = strProdName
        imgProd.image = UIImage.init(named: strProdName)
        lblProdName.text = strProdName
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        
        let button: UIButton = UIButton(type: UIButtonType.custom)
        button.setImage(UIImage(named: "ShoppingCart.png"), for: .normal)
        button.addTarget(self, action: #selector(ProdDetail_VC3.shoppingButtonPressed), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
        
        arrProdSize = ["Small","Medium","Large"]
        lblProdPrc.text = strProdPrc
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: strMRPrc)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lblMRPrc.attributedText = attributeString
        
    }
    
   @objc func shoppingButtonPressed()
    {
        print("Shopping Cart Button")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProdSize.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PDescCell", for: indexPath) as! ProdDesc_Cell_VC3
        
        cell.imgPSize.image = UIImage.init(named: strProdName)
        cell.lblPSize.text = arrProdSize[indexPath.row]
        cell.lblPPrice.text = strProdPrc
        
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        // cell = collectionView.cellForItem(at: indexPath) as! ProdDesc_Cell_VC3
    
        //cell = collectionView.indexPath(for: indexPath) as! ProdDesc_Cell_VC3
    
        let view1 = UIView()
        view1.frame = CGRect(x: 50, y: 100, width: 300, height: 400)
        view1.backgroundColor? = UIColor.black
        view1.alpha = 1
        self.view.addSubview(view1)
        print("OK")
    }

    @IBAction func btnPDetail(_ sender: Any)
    {
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "PDetail_VC4") as! VC4_PDetail
        self.navigationController?.present(vc4, animated: true, completion: nil)
        
    }
    




    /*
    //Start Expanded Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].desc.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].title, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15.0)
        cell.textLabel?.sizeToFit()
        cell.textLabel?.text = sections[indexPath.section].desc[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expanded {
            let height:CGFloat = calculateHeight(inString: sections[indexPath.section].desc[indexPath.row])
            return height
        }
        else {
            return 0
        }
    }
    
    func calculateHeight(inString:String) -> CGFloat
    {
        let messageString = inString
        //let attributes : [NSAttributedStringKey : Any?] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 15.0)]
        let attributes : [NSAttributedStringKey : Any?] = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15.0)]
        
        let attributedString : NSAttributedString = NSAttributedString(string: messageString, attributes: attributes)
        
        let rect : CGRect = attributedString.boundingRect(with: CGSize(width: 222.0, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        let requredSize:CGRect = rect
        return requredSize.height
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int)
    {
        sections[section].expanded = !sections[section].expanded
        
        self.tableView.frame = CGRect(x: self.tableView.frame.origin.x, y: self.tableView.frame.origin.y, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height + 300.0)
        
        tableView.beginUpdates()
        
        for i in 0..<sections[section].desc.count
        {
            tableView.reloadRows(at: [IndexPath(row: i, section:section)], with: .automatic)
            
        }
        tableView.endUpdates()
    }
    
    //End Expanded Table View
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    */
    
}
