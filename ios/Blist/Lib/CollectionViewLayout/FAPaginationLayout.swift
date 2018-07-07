
import UIKit

//private func updateCellsLayout()  {
//    let centerX = collectionView.contentOffset.x + (collectionView.frame.size.width)/2
//    for cell in collectionView.visibleCells {
//
//        var offsetX = centerX - cell.center.x
//        if offsetX < 0 {
//            offsetX *= -1
//        }
//        cell.transform = CGAffineTransform.identity
//        let offsetPercentage = offsetX / (view.bounds.width * 2.7)
//        //            let offsetPercentage = offsetX / (view.bounds.width * 5.0)
//
//        let scaleX = 1-offsetPercentage
//        cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
//    }
//}
////MARK: - UICollectionViewDelegateFlowLayout
//extension : UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        var cellSize: CGSize = collectionView.bounds.size
//
//        //        cellSize.width -= collectionView.contentInset.left * 2
//        //        cellSize.width -= collectionView.contentInset.right * 2
//        cellSize.width -= collectionView.contentInset.left * 1.2
//        cellSize.width -= collectionView.contentInset.right * 1.2
//
//        cellSize.height = cellSize.width
//        cardCellSize = cellSize
//
//        return cellSize
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        updateCellsLayout()
//    }
//
//}
public class FAPaginationLayout: UICollectionViewFlowLayout {
    
    var insertingTopCells: Bool = false
    var sizeForTopInsertions: CGSize = CGSize.zero
    
    //  Preparing the layout
    override public func prepare() {
        super.prepare()
        
        let oldSize: CGSize = sizeForTopInsertions
        
        if insertingTopCells {
            let newSize: CGSize  = collectionViewContentSize
            let xOffset: CGFloat = collectionView!.contentOffset.x + (newSize.width - oldSize.width)
            let newOffset: CGPoint = CGPoint(x: xOffset, y: collectionView!.contentOffset.y)
            collectionView!.contentOffset = newOffset
        } else {
            insertingTopCells = false
        }
        sizeForTopInsertions = collectionViewContentSize
    }
    
    //  configuring the content offsets relative to the scroll velocity
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var layoutAttributes: Array = layoutAttributesForElements(in: collectionView!.bounds)!
        
        if layoutAttributes.count == 0 {
            return proposedContentOffset
        }
        
        var firstAttribute: UICollectionViewLayoutAttributes = layoutAttributes[0]
        
        for attribute: UICollectionViewLayoutAttributes in layoutAttributes {
            if attribute.representedElementCategory != .cell {
                continue
            }
            if((velocity.x > 0.0 && attribute.center.x > firstAttribute.center.x) ||
                (velocity.x <= 0.0 && attribute.center.x < firstAttribute.center.x)) {
                firstAttribute = attribute;
            }
        }
        
        return CGPoint(x: firstAttribute.center.x - collectionView!.bounds.size.width * 0.5, y: proposedContentOffset.y)
    }
    
    
}

