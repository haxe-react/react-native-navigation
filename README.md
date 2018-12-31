# react-native-navigation
Haxe externs for wix's react-native-navigation v2

**react-native-navigation v1 is not supported by this lib**, please PR on a v1 branch if needed.

## Installation

Install the haxelib:
```
haxelib git https://github.com/haxe-react/react-native-navigation.git
```

Add this option to you `.hxml` file(s):
```
-lib react-native-navigation
```

## Usage

```
import react.native.navigation.Navigation;

// register your screens
Navigation.registerComponent('myapp.Login', function(){ return myapp.screen.Login; });
// or with redux
Navigation.registerComponentWithRedux('myapp.Home', function(){ return myapp.screen.Home; }, Provider, store);

// ...

// launch the app
Navigation.events().registerAppLaunchedListener(
    function(){
        Navigation.setRoot(
            {
                root: {
                    stack: {
                        children: [
                            {
                                component: {
                                    name: 'myapp.Login',
                                    options: {
                                        topBar: { visible: false }
                                    }
                                }
                            }
                        ],
                        options: {
                            layout: { orientation: [Portrait] },
                        }
                    }
                }
            }
        );
        reactnative.splashscreen.SplashScreen.hide();
    }
);

// ...

// then in your screen components, do:
Navigation.push(
    props.componentId,
    {
        component: {
            name: 'myapp.Home',
            passProps: { username: 'Thomas' },
            options: {
                topBar: {
                    title: { text: 'Welcome Thomas!' },
                }
            }
        }
    }
);
```

### Platforms specific

Android and iOS specific options are enabled with the `-D android` and `-D ios` compilation flags (in you `.hxml` file(s)).
