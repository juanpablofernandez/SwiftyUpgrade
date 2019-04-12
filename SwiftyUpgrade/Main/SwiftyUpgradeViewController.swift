//
//  SwiftyUpgrade.swift
//  SwiftyUpgrade
//
//  Created by Juan Pablo Fernandez on 1/23/19.
//  Copyright © 2019 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import StoreKit

class SwiftyUpgradeViewController: UIViewController {
    
    var featureCollectionView: UICollectionView!
    var subCollectionView: UICollectionView!
    var pageControl: UIPageControl!
    var selectedProduct: SKProduct?
    
    var delegate: SwiftyUpgradeDelegate? {
        return SwiftyUpgrade.shared.delegate
    }
    
    var features: [SwiftyUpgradeFeature] {
        get {
            return SwiftyUpgrade.features
        }
    }
    
    var products: [SKProduct] {
        get {
            return SwiftyUpgrade.products
        }
    }
    
    var contentScrollView: UIScrollView = {
        let view = UIScrollView()
        view.keyboardDismissMode = .interactive
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = SwiftyUpgrade.backgroundColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var infoLabel: UITextView = {
        let label = UITextView()
        label.text = SwiftyUpgrade.upgradeInfoText
        label.font = SwiftyUpgrade.upgradeInfoFont
        label.textColor = SwiftyUpgrade.upgradeInfoBodyTextColor
        label.isEditable = false
        label.backgroundColor = .clear
        label.dataDetectorTypes = .link
        label.isScrollEnabled = false
        label.linkTextAttributes = [.foregroundColor: SwiftyUpgrade.upgradeInfoBodyTextColor]
        label.textContainerInset = UIEdgeInsets.zero
        label.textAlignment = .center
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        paragraph.lineSpacing = 2
        
        let upgradeInfo = SwiftyUpgrade.upgradeInfoText
        
        let attributedString = NSMutableAttributedString(string: upgradeInfo, attributes: [
            .font: SwiftyUpgrade.upgradeInfoFont,
            .foregroundColor: SwiftyUpgrade.upgradeInfoBodyTextColor,
            .paragraphStyle: paragraph])
        
        //Title
        let titleAttribute: [NSAttributedString.Key: Any] = [.font: SwiftyUpgrade.upgradeInfoUrlFont,
                                                             .foregroundColor: SwiftyUpgrade.upgradeInfoTitleTextColor]
        let titleRange = (upgradeInfo as NSString).range(of: "Recurring billing, cancel anytime.")
        attributedString.addAttributes(titleAttribute, range: titleRange)
        
        //Terms
        let termsAttribute: [NSAttributedString.Key: Any] = [.font: SwiftyUpgrade.upgradeInfoUrlFont,
                                                             .link: SwiftyUpgrade.termsServiceUrl]
        let termsRange = (upgradeInfo as NSString).range(of: "Terms of Service")
        attributedString.addAttributes(termsAttribute, range: termsRange)
        
        //Privacy
        let privacyAttribute: [NSAttributedString.Key: Any] = [.font: SwiftyUpgrade.upgradeInfoUrlFont,
                                                               .link: SwiftyUpgrade.privacyPolicyUrl]
        let privacyRange = (upgradeInfo as NSString).range(of: "Privacy Policy")
        attributedString.addAttributes(privacyAttribute, range: privacyRange)
        
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var primaryButton: BounceButton = {
        let button = BounceButton()
        button.setTitle(SwiftyUpgrade.upgradeButtonTitle, for: .normal)
        button.titleLabel?.font = SwiftyUpgrade.upgradeButtonFont
        button.backgroundColor = SwiftyUpgrade.upgradeButtonBackgroundColor
        button.setTitleColor(SwiftyUpgrade.upgradeButtonTextColor, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var secondaryButton: BounceButton = {
        let button = BounceButton()
        button.setTitle(SwiftyUpgrade.cancelButtonTitle, for: .normal)
        button.backgroundColor = SwiftyUpgrade.cancelButtonBackgroundColor
        button.titleLabel?.font = SwiftyUpgrade.cancelButtonFont
        button.setTitleColor(SwiftyUpgrade.cancelButtonTextColor, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func reloadView() {
        self.subCollectionView.reloadData()
        self.subCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    @objc func handlePurchase() {
        delegate?.userDidTapPurchase(selectedProduct)
    }
    
    @objc func handleDismiss() {
        delegate?.userDidTapCancel()
        self.dismiss(animated: true, completion: nil)
    }
    
    func setup() {
        
        selectedProduct = products.first
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.80)
        view.isOpaque = false
        
        //ScrollView
        view.addSubview(contentScrollView)
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Container View
//        let a = view.bounds.height// - UIApplication.shared.statusBarFrame.size.height
//        let h = (a - (a * 0.85)) / 2
        contentScrollView.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        containerView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: h).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50).isActive = true
        containerView.heightAnchor.constraint(equalTo: contentScrollView.heightAnchor, multiplier: 0.85).isActive = true
        containerView.centerYAnchor.constraint(greaterThanOrEqualTo: contentScrollView.centerYAnchor, constant: 0).isActive = true
//        containerView.centerYAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.centerYAnchor, constant: 0).isActive = true
//        containerView.centerYAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.centerYAnchor, constant: 0).isActive = true
        
        // Collection View
        infoCollectionViewSetup()
        
        // Subscriptions View
        subCollectionViewSetup()
        
        //Page Control
        pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: featureCollectionView.bottomAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        //Seconday Button
        secondaryButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        containerView.addSubview(secondaryButton)
        secondaryButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 24).isActive = true
        secondaryButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -24).isActive = true
        secondaryButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        secondaryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Primary Button
        primaryButton.addTarget(self, action: #selector(handlePurchase), for: .touchUpInside)
        containerView.addSubview(primaryButton)
        primaryButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 24).isActive = true
        primaryButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -24).isActive = true
        primaryButton.bottomAnchor.constraint(equalTo: secondaryButton.topAnchor, constant: 0).isActive = true
        primaryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Info Label
        contentScrollView.addSubview(infoLabel)
        infoLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: -15).isActive = true
        infoLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 15).isActive = true
        infoLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -30).isActive = true
    }
}

extension SwiftyUpgradeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    //MARK: Subscription CollectionView
    
    func subCollectionViewSetup() {
        
        //Collection View Layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 1, right: 1)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        
        //Collection View Setup
        subCollectionView = UICollectionView(frame: containerView.bounds, collectionViewLayout: layout)
        subCollectionView.register(SwiftyUpgradeSubscriptionCell.self, forCellWithReuseIdentifier: "SubCell")
        subCollectionView.backgroundColor = SwiftyUpgrade.subscriptionsBackgroundColor
        subCollectionView.isPagingEnabled = true
        subCollectionView.clipsToBounds = false
        subCollectionView.delegate = self
        subCollectionView.dataSource = self
        containerView.addSubview(subCollectionView)
        
        //AutoLayout:
        subCollectionView.translatesAutoresizingMaskIntoConstraints = false
        subCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        subCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        subCollectionView.topAnchor.constraint(equalTo: featureCollectionView.bottomAnchor, constant: 0).isActive = true
        subCollectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.22).isActive = true
        subCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    
    //MARK: UICollectionViewSetup
    
    func infoCollectionViewSetup() {
        
        //Collection View Layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //Layout bottom inset: Take into account badge(10) pageControl(30)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInsetReference = .fromSafeArea
        
        //Collection View Setup
        featureCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        featureCollectionView.register(SwiftyUpgradeFeaturesCell.self, forCellWithReuseIdentifier: "FeatureCell")
        featureCollectionView.backgroundColor = SwiftyUpgrade.featuresBackgroundColor
        featureCollectionView.showsHorizontalScrollIndicator = false
        featureCollectionView.isPagingEnabled = true
        featureCollectionView.delegate = self
        featureCollectionView.dataSource = self
        containerView.addSubview(featureCollectionView)
        
        //AutoLayout:
        featureCollectionView.translatesAutoresizingMaskIntoConstraints = false
        featureCollectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        featureCollectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        featureCollectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        featureCollectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.44).isActive = true
    }
    
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        
        if collectionView == featureCollectionView {
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: (width-4)/3, height: height)
        }
    }
    
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == featureCollectionView {
            return
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! SwiftyUpgradeSubscriptionCell
            guard let product = cell.product else { return }
            self.selectedProduct = product
        }
    }
    
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featureCollectionView {
            pageControl.numberOfPages = features.count
//            pageControl.isHidden = !(5 > 1)
            return features.count
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featureCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureCell", for: indexPath) as! SwiftyUpgradeFeaturesCell
            configureFeatureCell(cell: cell, forItemAt: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCell", for: indexPath) as! SwiftyUpgradeSubscriptionCell
            configureSubCell(cell: cell, forItemAt: indexPath)
            return cell
        }
    }
    
    func configureFeatureCell(cell: SwiftyUpgradeFeaturesCell, forItemAt indexPath: IndexPath) {
        cell.feature = features[indexPath.row]
    }
    
    func configureSubCell(cell: SwiftyUpgradeSubscriptionCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row < products.count else { return }
        cell.product = products[indexPath.row]
    }
}

extension SwiftyUpgradeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        self.pageControl?.currentPage = Int(roundedIndex)
    }
}
