# todo_app

Flutter with Clean Architecture

#login


# Clean Architecture for Flutter
References:
https://github.com/MahmoudElbokl/flutter_clean_arch_sample_demo

This a sample app that implement Uncle Bob's Clean Architecture in Flutter.

There are 3 main Layers to help separate the code:

1- Domain.                                                                                                                                                                       
2- Data.                                                                                                                                                                         
3- Presentation.                                                                                                                                                                                                                                                                                                                                                 
<img src="./flutter_clean_arch.png" style="width: 75%;"/>

Domain Layer:
defines the business logic of the application and contains UseCases, Domain Entities, and Repository Interfaces.

Data Layer:
responsible for data retrieval and contains APIs, Local Storage, Data objects (Request, Response and DB objects), and the Repository Implementation.

Presentation
the UI of the application and contains Screens, Widgets and Presentation logic.

## References
* [The Clean Code Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [Reso Coder](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
* [Flutter Clean Architecture Series](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)


## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
