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

### How to run application

Open `Contacts.xcworkspace` in Xcode. 

From target dropdown menu select **Contacts** target. 

Run application on any iPhone simulator using play button. 

### Technical info: 

User Interface is build entirely in code (UIKit and AutoLayout). 

There are no liked 3<sup>rd</sup> party frameworks. 

Application target is set to iOS 12.0.

Unit tests - I did try to show how to test each important component of application codebase. Due to time constraints not all cases are covered. 

To run all unit test select **Contacts** target in Xcode, then *Product* > *Test* in menu. You can also select single target and run test only for that target. 

UI Tests are implemented as prove of concept. You can find code on `Demo` group in `Contacts.xcworkspace`. 

To run UI test select **ContactsListDemo** target in Xcode, then *Product* > *Test* in menu.

Communication with backend is mocked, but avatars are still loaded from network. Component responsible for loading images should also be mocked for UI tests. 

## Things to improve 

* Networking should be encapsulated in separated module as *specialized* component. 
* Some *code generation tool* should create constants for resource. 
* Linters should be part of development process. 
* To communicate between components should be used some reactive library (`Emitter*` classes are very naive implementation of reactive approach). 
* Some *service locator* should be used to hide details of module classes. 
* Error handling should be improved. 
* Application configuration (App icons, etc.).
* List with contacts shouldn't be reloaded by calling `UITableView.reloadData` method. There should be some diffing library which allows to compare data snapshots and calculate changes in data source. Only calculated changes should be passed to `UITableView` batch updates. 
* Layout code can be extracted as *component* from `UIView` classes and reused when application grows. 
* Some debug logs should be introduced. 


