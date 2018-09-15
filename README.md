# CollectionViewBug

This project showcases a bug with NSCollectionView. When animating an item that does not contain anything other than a label, the fade animation does not work when deleting+moving items. If a background color is set on the view, or another view (such as a 1x1 NSImageView) is added, animation works again.

![Alt text](bug.gif?raw=true "Bug")
