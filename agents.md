# AGENTS.md

## Overview

This document describes the code generation strategies and architectural guidelines for using Codex effectively within the SwiftUI project that leverages the MVVM (Model-View-ViewModel) architectural pattern with Service Locators for dependency injection, and utilizes Swift's Observation framework for ViewModel management.

---

## Project Architecture

### MVVM Structure

- **Models**: Pure data structures representing the app's domain.
- **Views**: SwiftUI views, responsible solely for UI rendering.
- **ViewModels**: Handle all business logic, state management, and interact with services, conforming to the Observation framework.

### Service Locators

- Centralized registry for dependencies.
- Provides loose coupling between ViewModels and service implementations.

---

## Codex Generation Guidelines

### Models

- Generate lightweight, Codable-compliant structures.
- Include clearly defined property names aligning with backend/API responses.

### ViewModels

- Generate ViewModel classes adhering strictly to MVVM principles, conforming to `@Observable` for seamless integration with SwiftUI views.
- Utilize observable properties for state updates and automatic view rendering.
- Include clear separation of logic methods for fetching data, state updates, and error handling.

### Services

- Generate protocol definitions clearly specifying the service capabilities.
- Implement default/mock services separately to facilitate testing.
- Ensure services are injected using the Service Locator.

### Views

- SwiftUI views must remain logic-free.
- Generate views using bindings (`@Bindable`) directly tied to their respective ViewModels.
- Views should consume ViewModel data strictly through observable properties provided by the Observation framework.

---

## Dependency Injection via Service Locator

### Registration

- Clearly define all service registrations in a centralized configuration (`ServiceLocator.swift`).
- Ensure services adhere to their respective protocols.

### Retrieval

- ViewModels should access dependencies exclusively through the Service Locator.
- Avoid direct instantiation of services within ViewModels.

```swift
@Observable
class SomeViewModel {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = ServiceLocator.shared.getService()) {
        self.apiService = apiService
    }
}
```

---

## Best Practices

- Maintain clear separation between View, ViewModel, and Model layers.
- Ensure all dependencies are abstracted and injected via the Service Locator.
- Write testable ViewModels and services to facilitate unit testing and maintainability.
- Regularly review generated code to maintain adherence to MVVM, Observation framework, and DI patterns.

---

## Example Folder Structure

```
Project/
├── Models/
├── Views/
├── ViewModels/
├── Services/
├── Utilities/
│   └── ServiceLocator.swift
└── Tests/
```

---

Follow these guidelines when generating code with Codex to ensure consistency, maintainability, and high quality in your SwiftUI project using MVVM, the Observation framework, and Service Locators.

