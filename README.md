# TravelGuideApp

<img width="1300" height="550" alt="appIcon" src="https://user-images.githubusercontent.com/32436596/195032896-7b622d45-3d53-4c0e-98cc-0d500926ead6.png">

### Description

- Articles are pulled from the Article json file and displayed in the collection view on the homepage.
- When the flight button is pressed, data is retrieved from https://aviationstack.com/documentation with Alamofire. The captured data is displayed using the table view on the Flight view screen.
- The information of the selected cell in the Flights Table view is displayed on the generic detail screen.
- When the Hotel button is pressed, data is taken from the Hotels json file. The captured data is displayed using the table view on the Hotel view screen.
- The information of the selected cell in the Hotels Table view is displayed on the generic detail screen.
- Sourcetree app was used. git flow structure implemented. Worked in development branch and merged into main branch.

Note: When the flight button is pressed, there may be a delay in loading the screen because the number of data retrieved from the API is high. Wait for a while after pressing the button.

### Home
- It is our home screen. This screen appears on first boot Best Choice
The articles part is completely pulled from the json file.


### Flights & Hotels Detail
- These are the screens that will be opened when the Flights and Hotels buttons on the main page are pressed. It is loaded by the *api query.

### Content Details
- It is the screen that will open when any recording is pressed in the application. This Screen is generic. In other words, this page displays the flight details, the hotel details, or the article details. *must be loaded by api with query.

### Uncompleted Screens

- Search
- Bookmarks

<img alt="HomePage" src="https://user-images.githubusercontent.com/32436596/195017245-98b81846-54ac-48ac-8f6a-59d3f5fcb645.png" width="250"/> <img alt="FlightsPage" src="https://user-images.githubusercontent.com/32436596/195017261-c1ef312f-8391-41f9-a2e8-f76d52d51727.png" width="250"/><img  alt="hotelsPage" src="https://user-images.githubusercontent.com/32436596/195017284-6b0ee698-f5f3-4e7b-8b02-142efef1d774.png" width="250"/><img  alt="flightDetailPage" src="https://user-images.githubusercontent.com/32436596/195017294-667936f3-b0f2-4242-95e1-e817d6c123b8.png" width="250"/><img  alt="hotelDetailPage" src="https://user-images.githubusercontent.com/32436596/195017304-bcb916cc-d5f4-424c-8365-b22a53a65b3c.png" width="250"/><img  alt="articleDetailPage" src="https://user-images.githubusercontent.com/32436596/195017312-0330724a-7d99-4a9e-acd6-51067fc34b02.png" width="250">


## Tools

#### Swift
  - Delegate
  - Protocol
  - Extensions
  - POP
  - OOP
  - Date
  - High Order Functions
  - Date Formatter
  
#### UIKit
  - CollectionView
  - TableView
  - Scroll View
  - Color Well
  - Auto Layout
  - TabBar
  - Navigation Controller
  
#### Network
  - Api : https://aviationstack.com/documentation
  - CoreData
  - Mock Data - JSON File
  
#### Design Pattern Architecture
  - MVVM 
  - 
#### Design
  - https://www.figma.com/file/WLJX33QX4BCP73bQLwBFBt/New-Travel-App---Responsive-UI-Shot-(Community)?node-id=1%3A81
  
#### Third-party Library
  - Kingfisher - You can dowload with this link from XCode File - Add Packages : https://github.com/onevcat/Kingfisher
  - Alamofire  - You can dowload with this link from XCode File - Add Packages: https://github.com/Alamofire/Alamofire

https://user-images.githubusercontent.com/32436596/195029418-9bf785e7-139b-4ce4-9db3-e6327586950b.mp4


 
