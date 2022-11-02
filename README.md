# food_delivery

A simple project built using cross-platform "flutter", especially for different reasons such as:<br />
1- Single codebase for all platforms, as this project builds for Android and iOS<br />
2- Performance is similar to the Native App as Flutter doesn’t rely on any intermediate code representations or interpretation<br />
3- Faster code writing, unlike native code, need to wait for it to compile, and be loaded on the device before seeing changes. But, with Flutter’s hot reload, changes can be checked immediately.<br />
4- The Potential Ability to Go Beyond Mobile,there’s also Flutter for Web and Flutter Desktop Embeddings now simple by running pure Flutter applications in a browser without modifying the source code<br />
But keep in mind there is some drawback with flutter where the native platform is more reliable for instance:<br />
1- Native technologies are more reliable for crafting AI applications or AR/VR<br />
2- For Location Centric apps<br />
3- By comparing the build time for the native app and the Flutter app, Flutter apps take a bit longer for clean builds.<br />
4- In terms of accessibility support, Flutters needs an improvement compared to native apps<br />
5- Comparing the size of the native and the Flutter app, Flutter apps appear to be heavier in size.<br />

As for the Food Delivery app, it's based on clean architecture based on the book and blog by Uncle Bob. It is a combination of concepts taken from Onion Architecture and other architectures. The main focus of the architecture is the separation of concerns and scalability. It consists of 3 main modules: App, Domain, and Data.<br />
Source code dependencies only point inwards. This means inward modules are neither aware of nor dependent on external modules. However, external modules are both aware of and dependent on inner modules. Outer modules represent the mechanisms by which the business rules and policies (inner modules) operate. The more you move inward, the more abstraction is present. The outer you move the more concrete implementations are present. Inner modules are not aware of any classes, functions, names, libraries, etc.. present in the outer modules. They simply represent rules and are completely independent of the implementations.<br />
features of the app, like getting food, will be divided into 3 layers(if required) - presentation, domain, and data.<br />
Presentation layer<br /><br />
This layer contains widgets to display UI on the screen. These widgets then dispatch events to the Bloc and listen for states to be able to update UI.<br /><br />
Domain layer<br />
is the inner layer. It will contain only the core business logic (use cases) and business objects (entities). It's independent of every other layer. Use Cases are classes that encapsulate all the business logic of a particular use case of the app (GetFoodUseCase). And the way that the domain gets data from a Repository, which is from the data layer is accomplished with dependency inversion which is managed in this app using get_it.<br />
"get_it" is a simple Service Locator for Dart and Flutter inspired by Splat and it is used in this app for<br />
1- It's extremely fast as it runs in a constant time (O(1))<br />
2- It doesn't clutter the UI tree with special widgets to access the data<br /><br />
Data layer<br />
the data layer consists of a Repository implementation (the contract comes from the domain layer) and data sources - one is for getting remote (API) data and the other for caching that data, unlike domain the data layer works with Models, not Entities Therefore, there is a Model class that extends Entity and adds some specific functionality (toJson, fromJson) or additional fields. The RemoteDataSource will perform HTTP GET requests on the Food API.<br />
As for error handling and exceptions managing, the "dartz package" will be used, it brings functional programming to dart and in our case we will be working with Either<L, R>.<br />
The Either type can be used to represent any two types at the same time, hence it's powerful for error handling, where L is the Failure and R is the Entity. This way, the Failures don't have their own special "error flow" like exceptions do. they will get handled as any other data without using try/catch. and this can be applied by the following steps as we're going to return a Model (converted from JSON). Errors will be handled by throwing Exceptions. Taking care of this data and converting it to the Either type will be the responsibility of the Repository.<br />
<br />
the other half of the data layer is the local data layer which can be noticed in "favorite feature" as favorite data is cached locally to be saved even if the app the killed, and the approach used is "Hive" as <br />
1- It greatly outperforms SQLite and SharedPreferences when it comes to writing or deleting.<br />
2- The hive contains strong encryption built in which makes it more secure.<br />

<br />
If I have time I would make some improvements such as:<br />
1- Enhance UI pages and widgets and make the design more user friendly<br />
2- Would cache the remote API response and view the cached response in case the user is disconnected<br />
3- Implement more features for the basket domain such as removing items from the basket and also calculating the total cost for all items added to the basket<br />
4- Would cache every category remote API response and would only rebuild the home screen if the remote API response is not the same as the cached response<br />
5- Would write unit testing before implementing production code (unfortunately I was only able to write unit testing for network service only due to the time)<br />
6- Would have made the application fully responsive for all screens with different sizes and viewing modes (portrait and landscape)<br />
7- Implement a page for all favorite data only to make the favorites list clear to the user.<br />

I believe this challenge was a great experience as it tests different topics such as architecture, designing, class communication, caching, and general coding skills.

