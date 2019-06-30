//
//  ProductVariantsVC.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/16/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit

class ProductVariantsVC: UIViewController {

    var product: Product?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productAvailability: UILabel!
    @IBOutlet weak var productShipping: UILabel!
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var stepperBtn: UIStepper!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var addToCartBtn: borderButton!
    @IBOutlet weak var colorValueLbl: UILabel!
    @IBOutlet weak var sizeValueLbl: UILabel!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage.sd_setImage(with: URL(string: (product?.images?.first)!), placeholderImage: UIImage(named: "placeholder_image"))
        productTitle.text = product?.name
        productPrice.text = "$ \(product?.price ?? 150)"
        productAvailability.text = "\(product?.availability ?? 1) available"
        productShipping.text = "Shipping: US $\(product?.shipping ?? 10)"
        stepperBtn.maximumValue = Double(product?.availability ?? 1)
        titleLbl.text = self.getByTagName(key: "productOptionLbl")
        colorLbl.text = self.getByTagName(key: "colorLbl")
        sizeLbl.text = self.getByTagName(key: "sizeLbl")
        qtyLbl.text = self.getByTagName(key: "qtyLbl")
        descriptionLbl.text = self.getByTagName(key: "descriptionShippingLbl")
        addToCartBtn.setTitle(self.getByTagName(key: "addtocart"), for: .normal)
        
        colorCollectionView.tag = 12
        sizeCollectionView.tag = 13
        
        colorCollectionView.delegate = self as UICollectionViewDelegate
        colorCollectionView.dataSource = self as UICollectionViewDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    @IBAction func stepperBtnPressed(_ sender: Any) {
        productQty.text = "\(Int(stepperBtn.value))"
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addToCartBtnPressed(_ sender: Any) {
        CartService.instance.addData(product_id: self.product!.uid!, qty: "\(product!.availability ?? 1)", color: "red", size: "xl" ){ (success) in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
            }
            else {
                
            }
        }
    }
}

extension ProductVariantsVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 12 {
            return (self.product?.colors?.count)!
        }
        else {
            return (self.product?.sizes?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: UICollectionViewCell
        if collectionView.tag == 12 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionCell", for: indexPath) as! ColorCollectionCell
        }
        else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionCell", for: indexPath) as! SizeCollectionCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}


