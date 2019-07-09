//
//  ViewController.swift
//  SideBarMenu 1
//
//  Created by Rahul Chopra on 13/12/17.
//  Copyright © 2017 learn2iOSCenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawerControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collVwBday:UICollectionView!
    
    @IBOutlet weak var collVwPr: UICollectionView!
    
    @IBOutlet weak var collVwBqt: UICollectionView!
    
    @IBOutlet weak var collVwCombo: UICollectionView!
    
    @IBOutlet weak var imgBannerTop: UIImageView!
    
    var drawerVw = DrawerView()
    var bgVw = UIView()
    
    var arrPrGift: [String] = []
    var arrPrPrc: [String] = []
    var arrPrMRP: [String] = []
    var arrBdayGift: [String] = []
    var arrPrsGift: [String] = []
    var arrBqtGift: [String] = []
    var arrComboGift: [String] = []
    
    var imageArray = [UIImage]()
    var xpos: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collVwBday.dataSource = self;
        self.collVwBday.delegate = self;
        self.collVwPr.dataSource = self;
        self.collVwPr.delegate = self;
        self.collVwBqt.dataSource = self;
        self.collVwBqt.delegate = self;
        self.collVwCombo.dataSource = self;
        self.collVwCombo.delegate = self;
        
        arrPrGift = ["Ganesha","Teddy Bear","Temple Jyot","Statue of Liberty","Lion","Laughing Buddha"]
        arrPrPrc = ["$1099","$1099","$99","$200","$250","$400"]
        arrPrMRP = ["$1499","$1499","$149","$500","$350","$600"]
        arrBdayGift = ["Cake-Chocolate","Dairymilk Chocolate","Bouquet-Mix","Cake-Vanilla"]
        arrPrsGift = ["Personalized Candle","Cushion-Reactangle","Lovable Frames","Love on the wall","Pillow-Square","Precious Mom Frame","Cube Rotating Photo Lamp","Cushion-Heart","Customized Mug"]
        arrBqtGift = ["Celebrate My Love","You-N-Me","Cute Teddy Surprise","Divine Love","Inspiration","Mixed-Roses-Lilies","Red Rose Hamper","Touch-of-romance"]
        arrComboGift = ["Combo-2 (Mug+Cushion)","Combo-Chocolates","Combo of 4 (Teddy+Cake+Chocolate+Flower)","Combo-2 (Flower+Chocolate)","Combo of Perfumes-4"]
        
        //Color & Add Logo to Navigation Controller
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        var colors = [UIColor]()
        colors.append(UIColor(red: 39/255, green: 98/255, blue: 165/255, alpha: 1))
        colors.append(UIColor(red: 39/255, green: 98/255, blue: 165/255, alpha: 1))
        navigationController?.navigationBar.setGradientBackground(colors: colors)
        
        //self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "logo.png"))
        
        self.navigationItem.title = "Personalised Guru"
        
        
        moveImages()
    }
    
    
    func moveImages()
    {
        UIView.animate(withDuration: 0.3) {
            self.imageArray = [#imageLiteral(resourceName: "TopBnr1"),#imageLiteral(resourceName: "TopBnr2"),#imageLiteral(resourceName: "TopBnr3")]
            for i in 0..<self.imageArray.count {
                let imgView = UIImageView()
                imgView.image = self.imageArray[i]
                imgView.contentMode = .scaleToFill
                
                self.xpos = self.view.frame.width * CGFloat(i)
                
                imgView.frame = CGRect(x:self.xpos, y:12,width:self.scrollView.frame.width,height:100)
                
                self.scrollView.contentSize.width = self.scrollView.frame.width * CGFloat (i + 1)
                self.scrollView.addSubview(imgView)
            }
        }
        
        
    }
    
    
    @IBAction func btnSideBar(_ sender: Any) {
        
        drawerVw = DrawerView(aryControllers: DrawerArray.array, isBlurEffect: true, isHeaderInTop: false, controller: self)
        drawerVw.delegate = self
        
        drawerVw.changeUserName(name: "Rahul Chopra")
        
        drawerVw.show()
    }
    
    func pushTo(viewController: UIViewController) {
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //Collection View for Cell-1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.collectionView
        {
            return arrPrGift.count
        }
        else if collectionView == self.collVwBday
        {
            return arrBdayGift.count
        }
        else if collectionView == self.collVwPr
        {
            return arrPrsGift.count
        }
        else if collectionView == self.collVwBqt
        {
            return arrBqtGift.count
        }
        else
        {
            return arrComboGift.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! cell1Home
            cell.imgGift.image = UIImage.init(named: arrPrGift[indexPath.row])
            cell.lblGift.text = arrPrGift[indexPath.row]
            cell.lblProdPrc.text = arrPrPrc[indexPath.row]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: arrPrMRP[indexPath.row])
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            
            cell.lblMRP.attributedText = attributeString
            return cell
        }
        else if collectionView == collVwBday
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellBday", for: indexPath) as! BdayCell
            cell.imgBday.image = UIImage.init(named: arrBdayGift[indexPath.row])
            cell.lblBday.text = arrBdayGift[indexPath.row]
            return cell
        }
        else if collectionView == collVwPr
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalizedCell", for: indexPath) as! PersonalizedCell
            cell.imgPrsGift.image = UIImage.init(named: arrPrsGift[indexPath.row])
            cell.lblPrsGift.text = arrPrsGift[indexPath.row]
            return cell
        }
        else if collectionView == self.collVwBqt
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BouquetCell", for: indexPath) as! BouquetCell
            cell.imgBouquet.image = UIImage.init(named: arrBqtGift[indexPath.row])
            cell.lblBouquet.text = arrBqtGift[indexPath.row]
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComboCell", for: indexPath) as! ComboCell
            cell.imgCombo.image = UIImage.init(named: arrComboGift[indexPath.row])
            cell.lblCombo.text = arrComboGift[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView {
            for i in 0..<arrPrGift.count {
                if indexPath.row == i {
                    let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "ProdDetailVC") as! ProdDetail_VC3
                    self.navigationController?.pushViewController(vc3, animated: true)
                    vc3.strProdName = arrPrGift[indexPath.row]
                }
            }
        }
        if collectionView == self.collVwBday {
            for i in 0..<arrBdayGift.count {
                if indexPath.row == i {
                    let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "ProdDetailVC") as! ProdDetail_VC3
                    self.navigationController?.pushViewController(vc3, animated: true)
                    vc3.strProdName = arrBdayGift[indexPath.row]
                }
            }
        }
        
        
    }
    
    @IBAction func btnViewAll1(_ sender: Any) {
        
        let prod_VC = self.storyboard?.instantiateViewController(withIdentifier: "ProductVC") as! ProdList_VC
       self.navigationController?.pushViewController(prod_VC, animated: true)
        prod_VC.navigationItem.title = "Gifts for all"
       
        
    }
    
    @IBAction func btnViewAll2(_ sender: Any) {
        
        let prod_VC = self.storyboard?.instantiateViewController(withIdentifier: "ProductVC") as! ProdList_VC
        self.navigationController?.pushViewController(prod_VC, animated: true)
        prod_VC.navigationItem.title = "Birthday Gift"
    }
    
    
    @IBAction func btnViewAll3(_ sender: Any) {
    }
    
    @IBAction func btnViewAll4(_ sender: Any) {
    }
    
    @IBAction func btnViewAll5(_ sender: Any) {
    }
    
    
   /* Add Header View within CollectionView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView: UICollectionReusableView? = nil
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! CollectionHeaderReusableView
            
            let title: String = "Statue Gifts"
            headerView.lblHeader.text = title
            
            
            
            
            var btn = UIButton()
            btn = UIButton.init(frame: CGRect(x:298, y:210, width:80, height:30))
           // btn.backgroundColor = UIColor.red
            btn.setTitleColor(UIColor.init(red: 0, green: 0, blue: 255, alpha: 1), for: UIControlState.normal)
            btn.setTitle("View all", for: UIControlState.normal)
            btn.titleLabel?.text = "View All"
            self.view.addSubview(btn)
            
            reusableView = headerView
        }
        
        return reusableView!
    }   */
 

}




struct DrawerArray {
    static let array: NSArray = ["Home", "About us", "History", "Gallery", "Contact us", "My Account"]
}

extension CAGradientLayer {
    
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0)
        endPoint = CGPoint(x: 0, y: 1)
    }
    
    func creatGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
}

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += 20
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.creatGradientImage(), for: UIBarMetrics.default)
    }
}
