# project_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Core rules

- Provider is used for dependency injection
- Freezed is used for data classes (api models only)
- Services are used for api calls or any other external calls (like local storage, rating service, etc)
- Repositories are used like a facade for services
- Business logic is placed in blocs/cubits and ChangeNotifier
- Blocs/Cubits are used for complex business logic, ChangeNotifier is used for simple business logic
- The structure of the project is based on the Clean Architecture to achieve the opportunity of easy scaling, testing and sharing the code
- Every layer depends on abstractions of the layer below only:
  - In presentation layer we can use only blocs/cubits and ChangeNotifier
  - In business logic layer we can use only repositories; blocs/cubits and ChangeNotifier depend on abstract repositories
  - In data layer we can use only services; repositories depend on abstract services
- The project is divided into two big parts:
  - Core contains all the code that is used in the whole project (like models, services, etc)
  - Features contains all the code that is used in a specific feature (like blocs, screens, etc)
- Every feature is divided into the next parts:
  - Data contains all the code that is used to implement the data layer of the feature (implementations of repositories)
  - Domain contains all the code that is used to implement the business logic of the feature (abstract classes of repositories, models, enums, etc)
  - Logic contains all the code that is used to implement the business logic of the feature (blocs, cubits, ChangeNotifier, etc)
  - Presentation contains all the code that is used to implement the presentation layer of the feature (screens, widgets, etc)

### Naming conventions

- All the files are named using the snake_case and should be named using the name of the class that is inside the file
- All the folders are named using the snake_case
- All the classes are named using the UpperCamelCase
- All the variables are named using the lowerCamelCase
- All abstract classes are named using the UpperCamelCase and have no prefix
- All the implementations of the abstract classes are named using the UpperCamelCase and have the Impl suffix

### Steps to adding a new screen with some business logic

1. Create a new widget in the presentation layer and design it

2. Create a new service in the core layer or use an existing one

   - You need to add a necessary method to the abstract class of the service and implement it in the implementation class
   - You need to understand what actually the service is doing and what it is responsible for
   - Use primitive types as parameters and return types of the methods of the service (like String, int, etc)

3. Create a new repository in the data layer as a facade for services or use an existing one.

   - You need to add a necessary method to the abstract class of the repository and implement it in the implementation class
   - You need to inject the service into the repository and use it to implement the method
   - The repository should depend on the abstract class of the service
   - Use primitive types as parameters and return types of the methods of the repository (like String, int, etc) or use data classes from the domain folder (like models, enums, etc)

4. Create a new bloc/cubit/ChangeNotifier in the logic layer and implement the business logic

   - You need to inject the repository into the bloc/cubit/ChangeNotifier and use it to implement the business logic
   - The bloc/cubit/ChangeNotifier should depend on the abstract class of the repository

5. Inject the bloc/cubit/ChangeNotifier using the Provider (BlocProvider for bloc/cubit or ChangeNotifierProvider for ChangeNotifier) into the context

6. Use this injected instance of bloc/cubit/ChangeNotifier in the widget (context.read(), context.watch() or BlocBuilder, BlocListener, etc)

7. For ChangeNotifier you need to call notifyListeners() after changing the state, example:

   ```dart
   class Counter extends ChangeNotifier {
     int _count = 0;
     int get count => _count;

     void increment() {
       _count++;
       notifyListeners();
     }
   }

   class CounterScreen extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
           final counter = context.watch<Counter>();

           return GestureDetector(
               onTap: () => counter.increment(),
               child: Text(
                   '${counter.count}',
               ),
           );
       }
   }
   ```

8. For bloc/cubit you need to call emit() after changing the state:

   - You can use emit(NewState()) in any method inside the cubit

     - Example:

     ```dart
     class CounterCubit extends Cubit<int> {
       CounterCubit() : super(0);

       void increment() => emit(state + 1);

       void decrement() => emit(state - 1);
     }

     class CounterScreen extends StatelessWidget {
         @override
         Widget build(BuildContext context) {
             final counterCubit = context.watch<CounterCubit>();

             return GestureDetector(
                 onTap: () => counterCubit.increment(),
                 child: Text(
                     '${counterCubit.state}',
                 ),
             );
         }
     }

     ```

   - You can use emit(NewState()) inside the on() method of the bloc only

     - Example:

     ```dart
     class CounterCubit extends Bloc<BlocEvent, BlocState> {
       CounterCubit() : super(0) {
         on<Increment>((event, emit) => emit(state + 1));
         on<Decrement>((event, emit) => emit(state - 1));
       }
     }


     class CounterScreen extends StatelessWidget {
         @override
         Widget build(BuildContext context) {
             final counterCubit = context.watch<CounterCubit>();

             return GestureDetector(
                 onTap: () => context.read<CounterCubit>().add(Increment()),
                 child: Text(
                     '${counterCubit.state}',
                 ),
             );
         }
     }
     ```

Only with such steps you can be sure that you are following the rules of the project and you are doing everything right.
