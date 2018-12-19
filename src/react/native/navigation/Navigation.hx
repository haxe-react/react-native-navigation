package react.native.navigation;

///
// Layouts

typedef LayoutHierarchy = {
    root : Layout,
}

typedef Layout = {
    ? component : ComponentLayout,
    ? stack : StackLayout,
    ? bottomTabs : TabsLayout,
    ? sideMenu : SideMenuLayout,
    ? splitView : SplitViewLayout,
}

typedef ComponentLayout = {
    ? id : String,
    name : String,
    ? passProps : Dynamic,
    ? options : LayoutOptions,
}

typedef StackLayout = {
    ? id : String,
    children : Array<ComponentLayout>,
    ? options : LayoutOptions,
}

typedef TabsLayout = {
    ? id : String,
    children : Array<ComponentLayout>,
    ? options : LayoutOptions,
}

typedef SideMenuLayout = {
    ? left : Layout,
    ? center : Layout,
    ? right : Layout,
}

typedef SplitViewLayout = {
    ? id : String,
    master : Layout,
    detail : Layout,
    ? options: LayoutOptions,
}

///
// Options

@:enum
abstract LayoutOrientation(String){
    var Portrait = 'portrait';
    var Landscape = 'landscape';
}

typedef LayoutOptions = {
    ? layout : {
        orientation : Array<LayoutOrientation>
    },
    ? topBar : TopBarOptions,
    ? bottomTabs : TabsOptions,
    ? bottomTab : TabOptions,
    ? sideMenu : SideMenuOptions,
    ? overlay : OverlayOptions,
    ? animations : AnimationsOptions,
    // SplitViewLayout only
    ? displayMode : String,
    ? primaryEdge : String,
    ? minWidth : Int,
    ? maxWidth : Int,
}

typedef AnimationsOptions = {
    ? setStackRoot : { enabled : Bool },
}

typedef TopBarOptions = {
    ? visible : Bool,
    ? title : { text : String },
    ? drawBehind : Bool,
    ? animate : Bool,
}

typedef SideMenuOptions = {

}

typedef TabsOptions = {
    ? currentTabIndex : Int,
    ? currentTabId : String,
    ? visible : Bool,
}

typedef TabOptions = {
    ? text : String,
    ? icon : String,
    ? testID : String,
    ? badge : String,
}

typedef OverlayOptions = {
    interceptTouchOutside : Bool
}

///
// Main API

@:jsRequire("react-native-navigation","Navigation")
extern class Navigation {
    // top level
    static public function registerComponent(id : String, cb : Void -> Dynamic) : Void;
    static public function registerComponentWithRedux(id : String, cb : Void -> Dynamic, provider : Dynamic, store : Dynamic) : Void;
    static public function events() : NavigationEvents;
    static public function setRoot(v : LayoutHierarchy) : Void;
    static public function showOverlay(v : Layout) : Void;
    static public function dismissOverlay(id : String) : Void;
    // screen level
    static public function push(id : String, l : Layout) : Void;
    static public function pop(id : String, ? mergeOptions : LayoutOptions) : Void;
    static public function popToRoot(id : String, ? mergeOptions : LayoutOptions) : Void;
    static public function popTo(id : String, ? mergeOptions : LayoutOptions) : Void;
    static public function setStackRoot(id : String, l : Layout) : Void;
    static public function showModal(l : Layout) : Void;
    static public function dismissModal(id : String, ? mergeOptions : LayoutOptions) : Void;
    static public function dismissAllModals(? mergeOptions : LayoutOptions) : Void;
    static public function mergeOptions(id : String, options : Layout) : Void;

}
