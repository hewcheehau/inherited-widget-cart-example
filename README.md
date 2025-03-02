# cart_inherited_demo

This project demontrates the use of inherited widget as simple state management solutions in add to cart function 

## Inherited widget
A special type of widget in flutter that allows data sharing across the widget tree where parent data can share to other children widgets without passing it expliciliting in contructor


## App tree
CART_INHERITED_DEMO/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── app_state.dart
│   ├── features/
│   │   ├── home/
│   │   │   ├── view/
│   │   │   │   ├── cart_widget.dart
│   │   │   │   ├── home_page.dart
│   ├── widgets/
│       ├── app_state_widget.dart
├── assets/
│   ├── screenshort
├── pubspec.yaml
├── README.md

## App Flows
<blockquote>
runApp -> **AppStateWidget** -> App -> HomePage -> Cart
</blockquote>

### Rebuild 
<blockquote>final data = AppStateScrope.of(context) in build method</blockquote>