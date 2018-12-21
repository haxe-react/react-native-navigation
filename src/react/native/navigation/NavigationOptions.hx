package react.native.navigation;

@:enum
abstract ModalPresentationStyle(String) {
#if ios
    var FormSheet = 'formSheet';
    var PageSheet = 'pageSheet';
    var OverFullScreen = 'overFullScreen';
    var CurrentContext = 'currentContext';
    var PopOver = 'popOver';
    var FullScreen = 'fullScreen';
#end
    var OverCurrentContext = 'overCurrentContext';
    var None = 'none';
}

typedef NavigationOptions = {
    ? statusBar : StatusBarOptions,
    ? layout : LayoutOptions,
    ? modalPresentationStyle : ModalPresentationStyle,
    ? topBar : TopBarOptions,
    ? bottomTabs : BottomTabsOptions,
    ? bottomTab : BottomTabOptions,
    ? sideMenu : SideMenuOptions,
    ? overlay : OverlayOptions,
    ? preview : PreviewOptions,
    // SplitViewLayout only
    ? displayMode : String,
    ? primaryEdge : String,
    ? minWidth : Int,
    ? maxWidth : Int,
#if ios
    ? popGesture : Bool,
    ? backgroundImage : String,
    ? rootBackgroundImage : String,
#end   
}

@:enum 
abstract StatusBarStyle(String) {
    var Light = 'light';
    var Dark = 'dark';
}
typedef StatusBarOptions = {
    ? visible : Bool,
    ? style : StatusBarStyle,
#if android
    ? backgroundColor : String,
    ? drawBehind : Bool,
#end
#if ios
    hideWithTopBar : Bool,
    blur : Bool,
#end
}

@:enum
abstract LayoutOrientation(String){
    var Portrait = 'portrait';
    var Landscape = 'landscape';
#if android
    var SensorLandscape = 'sensorLandscape';
#end
}
typedef LayoutOptions = {
    ? orientation : Array<LayoutOrientation>,
    ? backgroundColor : String,
#if android
    ? topMargin : Float, // Navigation.constants().statusBarHeight, // Set the layout's top margin
#end
}

@:enum
abstract AlignmentValue(String) {
    var Left = 'left';
    var Center = 'center';
    var Right = 'right';
}
#if ios
@:enum
abstract IosBarStyle(String) {
    var Default = 'default';
    var Black = 'black';
}
#end
typedef TopBarOptions = {
    ? visible : Bool,
    ? animate : Bool, // Controls whether TopBar visibility changes should be animated
    ? hideOnScroll : Bool,
    ? buttonColor : String,
    ? drawBehind : Bool,
    ? testID : String,
    ? title : {
        ? text : String,
        ? fontSize : Int,
        ? color : String,
        ? fontFamily : String,
        ? component : {
            name : String,
            ? alignment : AlignmentValue
        },
#if android
        ? height : Float, // TitleBar height in dp
        ? alignment : AlignmentValue, // Center title
#end
    },
    ? subtitle : {
        ? text : String,
        ? fontSize : Int,
        ? color : String,
        ? fontFamily : String,
        ? alignment : AlignmentValue
    },
    ? backButton : {
        ? icon : String,
        ? visible : Bool
    },
    ? background : {
        ? color : String,
        ? component : {
            name : String
        }
    },
#if android
    ? height : Float, // TopBar height in dp
    ? borderColor : String,
    ? borderHeight : Float,
    ? elevation : Float, // TopBar elevation in dp
    ? topMargin : Float, // top margin in dp
#end
#if ios
    ? barStyle : IosBarStyle,
    ? background : {
        ? color : String,
        ? translucent : Bool,
        ? blur : Bool
    },
    ? noBorder : Bool,
    ? backButton : {
        ? title : String,
        ? showTitle : Bool
    },
    ? searchBar : Bool, // iOS 11+ native UISearchBar inside topBar
    ? searchBarHiddenWhenScrolling : Bool,
    ? searchBarPlaceholder : String, // iOS 11+ SearchBar placeholder
    ? largeTitle : {
        ? visible : Bool,
        ? fontSize : Int,
        ? color : String,
        ? fontFamily : String
    },
#end
}

#if android
@:enum
abstract TabTitleDisplayMode(String){
    var AlwaysShow = 'alwaysShow';
    var ShowWhenActive = 'showWhenActive';
    var AlwaysHide = 'alwaysHide';
}
#end
typedef BottomTabsOptions = {
    ? visible : Bool,
    ? animate : Bool, // Controls whether BottomTabs visibility changes should be animated
    ? currentTabIndex : Int,
    ? currentTabId : String,
    ? testID : String,
    ? drawBehind : Bool,
    ? backgroundColor : String,
#if android
    ? elevation : Float, // BottomTabs elevation in dp
    ? titleDisplayMode : TabTitleDisplayMode, // Sets the title state for each tab.
#end
#if ios
    ? barStyle : IosBarStyle,
    ? translucent : Bool,
    ? hideShadow : Bool
#end
}

typedef BottomTabOptions = {
    ? text : String,
    ? badge : String,
    ? badgeColor : String,
    ? testID : String,
    ? icon : String,
    ? iconColor : String,
    ? selectedIconColor : String,
    ? textColor : String,
    ? selectedTextColor : String,
    ? fontFamily : String,
    ? fontSize : Int,
#if android
    ? selectedFontSize : Float, // Selected tab font size in sp
#end
#if ios
    ? iconInsets : { top : Int, left : Int, bottom : Int, right : Int },
    ? selectedIcon : String,
    ? disableIconTint : Bool, //set true if you want to disable the icon tinting
    ? disableSelectedIconTint : Bool
#end
}

#if ios
@:enum
abstract IosSideMenuAnimation(String) {
    var Parallax = 'parallax';
    var Door = 'door';
    var Slide = 'slide';
    var SlideAndScale = 'slide-and-scale';
}
#end
typedef SideMenuPartOptions = {
    ? width : Int,
    ? height : Int,
    ? visible : Bool,
    ? enabled : Bool,
#if ios
    ? shouldStretchDrawer : Bool, // defaults to true, when false sideMenu contents not stretched when opened past the width
    ? animationVelocity : Int, // defaults to 840, high number is a faster sideMenu open/close animation
    ? animationType : IosSideMenuAnimation // defaults to none if not provided
#end
}
typedef SideMenuOptions = {
    ? left : SideMenuPartOptions,
    ? right : SideMenuPartOptions
#if ios
    openGestureMode: 'entireScreen' | 'bezel'
#end
}

typedef OverlayOptions = {
    interceptTouchOutside : Bool
}

@:enum
abstract PreviewActionStyle(String) {
    var Default = 'default';
    var Selected = 'selected';
    var Destructive = 'destructive';
}
typedef PreviewActionOptions = {
    ? id : String,
    ? title : String,
    ? style : PreviewActionStyle,
    ? actions : Array<PreviewActionOptions>
}
typedef PreviewOptions = {
    ? reactTag : Int, // result from findNodeHandle(ref)
    ? width : Int,
    ? height : Int,
    ? commit : Bool,
    ? actions : Array<PreviewActionOptions>,
}