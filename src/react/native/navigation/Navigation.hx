package react.native.navigation;

typedef LayoutHierarchy = {
    root : Layout,
}

@:jsRequire("react-native-navigation","Navigation")
extern class Navigation {
    static public var Element : react.React.CreateElementType;
#if ios
    static public var TouchablePreview : react.React.CreateElementType;
#end
    // top level
    static public function registerComponent(id : String, cb : Void -> Dynamic) : Void;
    static public function registerComponentWithRedux(id : String, cb : Void -> Dynamic, provider : Dynamic, store : Dynamic) : Void;
    static public function events() : NavigationEvents;
    static public function setRoot(v : LayoutHierarchy) : Void;
    static public function showOverlay(v : Layout) : Void;
    static public function dismissOverlay(id : String) : Void;
    // screen level
    static public function push(id : String, l : Layout) : Void;
    static public function pop(id : String, ? mergeOptions : NavigationOptions) : Void;
    static public function popToRoot(id : String, ? mergeOptions : NavigationOptions) : Void;
    static public function popTo(id : String, ? mergeOptions : NavigationOptions) : Void;
    static public function setStackRoot(id : String, l : Layout) : Void;
    static public function showModal(l : Layout) : Void;
    static public function dismissModal(id : String, ? mergeOptions : NavigationOptions) : Void;
    static public function dismissAllModals(? mergeOptions : NavigationOptions) : Void;
    static public function mergeOptions(id : String, options : NavigationOptions) : Void;
    // others
    static public function setDefaultOptions(options : NavigationOptions) : Void;
    static public function constants() : NavigationConstants;
}
