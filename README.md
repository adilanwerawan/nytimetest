# Nytimetest-repo

**About The Project**
This is an NYTimes most popular articles app iOS repo.

**It uses :**

•    Swift 4.2
•    Autolayouts
•    Pods
•    Storyboards
•    MVVM


**Branches :**

•    Master

**Features :**

**Master Branch**

•    Home view controller with listing of most popular articles from new yor times
•    Details page for each artice
•    Unit tests includes
•    Alamofire used for api parsing
•    MVVM used as base architecture
•    Cocoa pods has been used for dependency management

**Testing the app:**

To run the app do following steps

•    Go to Nytimetest/NYTimesPopularTest 
•    Open NYTimesPopularTest.xcworkspace
•    And then you can run by pressing on run button in xcode to your favorite simulator or device

To run the unit tests do following steps

•    Go to product then press test or you can do it by pressing command + u
•    It will run all the test cases which you can see in Test navigator in Navigator window (at right side of xcode)

To see the **code coverage** there is default xcode navigator named Report navigator in which you can see the code coverage.


**Folder Structure :**

**You can find..**
•    All the view controllers inside the Controllers folder.
•    All the models inside the Model folder.
•    Api managers inside the ViewModel folder.
•    Api wrapper,api endpoints inside the Networking folder
•    All the extenions like UITextfieldExtenion,StringExtension etc inside the Utilities/Extensions folder.
•    Alamofire used for http networking
•    Utilities like Alerts, DeviceUtility to get device type and sizes, AppStoryboardAndNavigation class for setting and loading viewcontrollers from thier storyboards and other utilities inside the Utilities folder.
•    Custom views created if any then it would be in Custom folder.
•    Pods used for managing third party libraries.

**Funtionality and implmentations:**

**Storyboards**

•    Confirm you viewcontrollers to StoryBoardHandler and give names of your iphone and ipad(if needed) storyboard.
•    Storyboadhandler protocol has been made on AppStoryboardAndNavigation class.
•    There is Enum StoryboardsEnum for storyboards where you defined names of your storyboards. 

**Networking and api usage**

•    For apis and networking we are using Alamofire
•    We have created wrapper using Alamofire named AFWrapper.
•    Api end points should be defined in ApiEndPoints class.
•    For using or implmenting the apis. Follow the steps below :

**BaseVC**

•    For customizing your navigation bar with fonts, bar background color and back button editting and other bar button items you can use base class.
•    There is also a static function in base class which is responsible for your navBar customization.
•    We can setup our side menu also in BaseVC in future when needed.

**Third party libraries management using Pods**

•    We have setuped also this project for using pods.
•    Any third party library for CocoaControls or CocoaPods you can add using pods. Simple add pod of the lib like we added for Alamofire and install it using terminal.

