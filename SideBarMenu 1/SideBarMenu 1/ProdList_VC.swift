//
//  ProdList_VC.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 18/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import UIKit

class ProdList_VC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource
{
    let imgTopBnr = UIImageView()

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrProdName: [String] = []
    var arrDiscPrc: [String] = []
    var arrMRPrc: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationItem.title = "Birthday Gift"
      //  self.navigationController?.navigationBar.tintColor = UIColor.white

        imgTopBnr.frame = CGRect(x: 0, y: ((self.navigationController?.navigationBar.frame.origin.y)! + 46), width: self.view.frame.width, height: 117)
        imgTopBnr.image = UIImage.init(named: "Banner.jpg")
        imgTopBnr.contentMode = .scaleToFill
        self.view.addSubview(imgTopBnr)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        arrProdName = ["Cushion-Reactangle","Bouquet-Mix","Cake-Chocolate","Cake-Vanilla","Dairymilk Chocolate","Teddy Bear","Personalized Candle","Customized Mug"]
        arrDiscPrc = ["$510","$299","$499","$750","$99","$1099","$1500","$190"]
        arrMRPrc = ["$700","$399","$650","$999","$149","$1500","$1899","$250"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProdName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProdCat_Cell
        
        cell.imgProd.image = UIImage.init(named: arrProdName[indexPath.row])
        cell.lblProdName.text = arrProdName[indexPath.row]
        cell.lblDisPrc.text = arrDiscPrc[indexPath.row]
        
        //To Stroke the line in MRP Price.
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: arrMRPrc[indexPath.row])
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        
        
        cell.lblMRPrc.attributedText = attributeString
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        for i in 0..<arrProdName.count {
            if indexPath.row == i
            {
                let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "ProdDetailVC") as! ProdDetail_VC3
                self.navigationController?.pushViewController(vc3, animated: true)
                
                vc3.strProdName = arrProdName[indexPath.row]
                vc3.strProdPrc = arrDiscPrc[indexPath.row]
                vc3.strMRPrc = arrMRPrc[indexPath.row]
            }
        }
    }

}
