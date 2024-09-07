# HelloCoffee ☕️

HelloCoffee is a Swift-based iOS application that allows users to order coffee. It includes functionality for adding, editing, and deleting coffee orders, with a clear UI and asynchronous data handling using modern Swift features like SwiftUI, Combine, and async/await.

## Features

- **Add New Coffee Order:** Users can add new coffee orders by entering the name, coffee type, size, and price.
- **Edit Coffee Order:** Users can update existing coffee orders through the order details screen.
- **Delete Coffee Order:** Users can delete a coffee order directly from the list.
- **Order Details View:** View detailed information for each order, with options to edit or delete the order.
- **Asynchronous API Handling:** The app uses async/await to fetch, update, and delete data from a backend server.
- **End-to-End Tests:** The app includes end-to-end testing for adding, updating, and deleting orders using XCTest.

## Requirements

- iOS 14.0+
- Xcode 12+
- Swift 5.0+

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/HelloCoffee.git
    ```

2. Navigate to the project directory:

    ```bash
    cd HelloCoffee
    ```

3. Open the project in Xcode:

    ```bash
    open HelloCofee.xcodeproj
    ```

4. Run the app on your preferred simulator or device.

## Usage

### Adding a New Coffee Order

1. Click on the "Add New Order" button on the top-right corner.
2. Fill in the required details (name, coffee type, size, and price).
3. Press the "Place Order" button to save the order.

### Editing an Order

1. Navigate to the order details by tapping on an order from the list.
2. Press the "Edit Order" button to update the order's details.
3. Save the updated order.

### Deleting an Order

1. Swipe left on an order in the list.
2. Press the "Delete" button to remove the order.

## End-to-End Tests

This project includes end-to-end tests for adding, updating, and deleting coffee orders. These tests are written using XCTest and are located in the `HelloCofeeEnd2EndITests` folder.

To run the tests:

1. Open the project in Xcode.
2. Select the test target (`HelloCofeeEnd2EndITests`).
3. Press `Cmd + U` to run all tests.

### Test Cases

- **Adding a Coffee Order:** Ensures that a new coffee order can be added and displayed correctly.
- **Updating a Coffee Order:** Verifies that an existing coffee order can be updated successfully.
- **Deleting a Coffee Order:** Confirms that a coffee order can be deleted and removed from the list.
- **No Orders Available:** Tests the scenario where no coffee orders are available and the proper message is displayed.

## Project Structure

- `Views/`: Contains the SwiftUI views for the app.
  - `ContentView.swift`: The main view that displays the list of coffee orders.
  - `AddCoffeeView.swift`: The view for adding new coffee orders.
  - `OrderDetailsView.swift`: The view for displaying and editing details of a coffee order.
- `Models/`: Contains the data models for the app.
  - `Order.swift`: Defines the structure of a coffee order.
  - `CoffeeModel.swift`: Manages the state and data fetching for coffee orders.
- `Services/`: Contains the network layer.
  - `WebService.swift`: Handles API calls for fetching, updating, deleting, and placing coffee orders.
- `Utils/`: Contains utility files.
  - `AppEnvironment.swift`: Handles the app’s environment and configurations.

## API

The app interacts with a backend server to fetch, update, and delete coffee orders. Below are the API endpoints used:

- `GET /test/orders`: Fetches all orders.
- `POST /test/new-order`: Creates a new order.
- `PUT /test/order/{id}`: Updates an existing order.
- `DELETE /test/order/{id}`: Deletes an existing order.


## Contact

For any inquiries, you can reach me at [anupsaud10@gmail.com](mailto:anupsaud10@gmail.com).
