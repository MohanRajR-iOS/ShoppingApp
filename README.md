# ShoppingApp

**About the Project
This iOS shopping app showcases a list of products and allows users to view detailed information for each item. It is built using modern Swift best practices, specifically the MVVM (Model-View-ViewModel) architectural pattern to ensure a clean separation of concerns, and uses SwiftData for robust and efficient local data persistence.

#Key features
* Product Listing: Browse a curated list of available products.
* Product Details: View detailed information for a specific product, including its description, images, and price.
* Offline Data Access: Products are stored locally using SwiftData, allowing users to view them even without an internet connection.
* MVVM Architecture: The codebase is structured with clear separation between the UI (View), business logic (ViewModel), and data models (Model), making it more testable and maintainable.

#Technical Architecture

**MVVM (Model-View-ViewModel)**
The app follows the MVVM design pattern, which separates the UI from the business logic.
* Model: Represents the data structure, such as Product and Product Details. The models are also managed by SwiftData for local storage.
* View: The SwiftUI interface that the user interacts with. It passively observes the ViewModel for updates and sends user actions to the ViewModel.
* ViewModel: Serves as the intermediary between the Model and the View. It contains the business logic, handles state management, and provides data to the View.

**SwiftData**
For local data persistence, the app leverages Apple's SwiftData framework.
* Offline Capability: Caches product information to ensure a smooth user experience, even with limited connectivity.
* Model Management: SwiftData manages the object graph and persistence layer, abstracting away complex database operations.

**Installation**
To get a local copy up and running, follow these simple steps.

**Prerequisites**
* Xcode 15 or later
* iOS 17 or later

**Steps**
1. Clone the repository:sh git clone https://github.com/MohanRajR-iOS/ShoppingApp.git 
2. Navigate to the project directory:sh cd your-repository
3. Open the project in Xcode:sh open ShoppingApp.xcodeproj

#Usage
1. Upon launching the app, you will be presented with a list of products.
2. Tap on any product to navigate to its details page.
3. The app uses SwiftData to store and retrieve product information, so you can browse products offline after the initial load.





























































