MediaDesign Expert
A Flutter mobile app designed to manage product-related workflows, from adding products to submitting orders, with a focus mode to enhance productivity. This app uses modern architectural patterns, state management, and dependency injection for maintainability and scalability.

KEY FEATURES
Add Product – Allows users to add products with name and quantity, ensuring only valid data is included in orders.
Submit Order – Submits only the rows with valid data (both name and quantity), skipping incomplete rows.
Focus Mode – Provides a distraction-free environment for users by hiding non-essential elements.
Search Suggestions – Fetches and filters product suggestions based on the user's query, providing relevant results.
Order Details – Displays details about the submitted order, including products and quantities.
Clear Table – Clears all entered product rows for resetting the form.
State Management with Provider – Efficient state management using the Provider package, allowing for dynamic updates and seamless UI changes.
MVVM Architecture – Utilizes the Model-View-ViewModel (MVVM) design pattern to separate UI, logic, and data layers.
Dependency Injection – Leverages Stacked for dependency injection, ensuring that services and ViewModels are easily testable and maintainable.
Error Handling – Handles errors in fetching product suggestions, including timeouts and invalid responses, and logs relevant messages.
ARCHITECTURE
MVVM Architecture –

The Model layer handles business logic, including product data and order management.
The ViewModel serves as the bridge between the UI (View) and the business logic (Model). It manages data and business logic for the UI layer.
The View is the UI layer, which displays data received from the ViewModel and handles user interactions.
Stacked Architecture –

Based on the Stacked Flutter framework, this architecture promotes clean code by separating concerns and using Dependency Injection.
The NavigatorService is used for navigation, and ProductService handles product-related API calls.
State Management –

Uses Provider for reactive state management, ensuring that the UI updates automatically when underlying data changes.
Dependency Injection –

Services and ViewModels are injected into the UI layer using Stacked's Locator, promoting modular and testable code.
