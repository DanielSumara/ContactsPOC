# Coding test


## Description

Application use [Random User Generator](https://randomuser.me) as backend service. 

Navigation is implemented on `UINavigationController`. 

Screens: 

* Contacts list
  * Shows loading indicator while fetching data from network
  * Presents data as list of contacts when downloaded
  * Allow to filter only favorites contacts
* Contact details
  * Present contact details
  * Allow mark contact as favorite
  * Allow edit contact
* Contact edit form
  * Placeholder to demonstrate modal presentation of screen

Class `UserDefaultsFavoritesStore` is responsible for persisting favorites between app launches. 

Synchronization of multiple requests is implemented in `DefaultImagesRepository` class. 

Loading state is implemented on *Contacts Screen* by presenting `UIActivityIndicatorView` with action description and on each `AvatarView` by presenting small `UIActivityIndicatorView` while avatar photo is downloading. 

Errors are handle by presenting `UIAlertController` with title, error description and *Understand* button. 
There should be implemented mechanism which allow user "refresh" data if error occurs.  
In case where Internet connection turns from off to on, data should be reloaded. 

### Technical info: 

User Interface is build entirely in code (UIKit and AutoLayout). 

There are no liked 3<sup>rd</sup> party frameworks. 

Application target is set to iOS 12.0.

Unit tests - I did try to show how to test each important component of application codebase. Due to time constraints not all cases are covered. 

To run all unit test **Contacts** target in Xcode, then *Product* > *Test* in menu. You can also select single target and run test only for that target. 

UI Tests are implemented as prove of concept. You can find code on `Demo` group in `Contacts.xcworkspace`. 

To run UI test select **ContactsListDemo** target in Xcode, then *Product* > *Test* in menu.

Communication with backend is mocked, but avatars are still loaded from network. Component responsible for loading images should also be mocked for UI tests. 
