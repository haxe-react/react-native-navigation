package react.native.navigation;

@:enum
abstract ModalPresentationStyle(String) to String {
    var OverCurrentContext = 'overCurrentContext';
#if ios
    var FormSheet = 'formSheet';
    var PageSheet = 'pageSheet';
    var OverFullScreen = 'overFullScreen';
    var CurrentContext = 'currentContext';
    //var PopOver = 'popOver';//Where is this coming from?
    var FullScreen = 'fullScreen';
#elseif android
    var None = 'none';
#end
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
    ? animations : AnimationsOptions,
    ? customTransition : SharedElementsTransition,
#if ios
    ? popGesture : Bool,
    ? backgroundImage : String,
    ? rootBackgroundImage : String,
    //? preview : Dynamic,
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
    ? componentBackgroundColor : String, // Set background color only for components, helps reduce overdraw if background color is set in default options.
#if android
    ? topMargin : Float, // Navigation.constants().statusBarHeight, // Set the layout's top margin
#end
}

typedef ButtonOptions = {
    id : String,
    ? icon : String,
    ? component : {
        name : String,
        ? passProps: Dynamic,
    },
    ? text : String,
    ? enabled : Bool,
    ? disableIconTint : Bool,
    ? color : String,
    ? disabledColor : String,
    ? testID : String,
}

@:enum
abstract AlignmentValue(String) {
    var Left = 'left';
    var Center = 'center';
    var Right = 'right';
}


@:enum
abstract TitleAlignmentValue(String) {
    var Left = 'left';
    var Center = 'center';
    var Right = 'right';
    var Fill = 'fill';
}

#if ios
@:enum
abstract IosBarStyle(String) {
    var Default = 'default';
    var Black = 'black';
}

#end
typedef TopBarOptions = {
    ? leftButtons : Array<ButtonOptions>,
    ? rightButtons : Array<ButtonOptions>,
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

//IOS Only for the moment... for the left/right Buttons (left sure, right...)
        ? component : {
            name : String,
            ? alignment : TitleAlignmentValue,
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
        ? visible : Bool,
        ? showTitle : Bool,
        ? color : String,
        #if ios
        ? title : String,
        #end
    },
    ? background : {
        ? color : String,
        ? component : {
            name : String
        },
        #if ios
        ? translucent : Bool,
        ? blur : Bool,
        #end
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
    ? noBorder : Bool,
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

@:enum
abstract IosOpenGestureMode(String) {
    var EntireScreen = 'entireScreen';
    var Bezel = 'bezel';
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
    ? right : SideMenuPartOptions,
#if ios
    ? openGestureMode : IosOpenGestureMode,
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

typedef SharedElementTransition = {
    type : String,
    fromId : String,
    toId : String,
    startDelay : Float,
    springVelocity : Float,
    duration : Float,
}

typedef SharedElementsTransition = {
    animations : Array<SharedElementTransition>,
    duration : Float
}

#if ios
typedef SplitViewOptions = {
    ? displayMode : String,
    ? primaryEdge : String,
    ? minWidth : Int,
    ? maxWidth : Int,
}
#end