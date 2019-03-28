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
    static public function events() : EventsRegistry;
    static public function setRoot(v : LayoutHierarchy) : js.Promise<Dynamic>;
    static public function showOverlay(v : Layout) : js.Promise<Dynamic>;
    static public function dismissOverlay(id : String) : js.Promise<Dynamic>;
    // screen level
    static public function push(id : String, l : Layout) : js.Promise<Dynamic>;
    static public function pop(id : String, ? mergeOptions : NavigationOptions) : js.Promise<Dynamic>;
    static public function popToRoot(id : String, ? mergeOptions : NavigationOptions) : js.Promise<Dynamic>;
    static public function popTo(id : String, ? mergeOptions : NavigationOptions) : js.Promise<Dynamic>;
    static public function setStackRoot(id : String, l : haxe.extern.EitherType<Layout,Array<Layout>>) : js.Promise<Dynamic>;
    static public function showModal(l : Layout) : js.Promise<Dynamic>;
    static public function dismissModal(id : String, ? mergeOptions : NavigationOptions) : js.Promise<Dynamic>;
    static public function dismissAllModals(? mergeOptions : NavigationOptions) : js.Promise<Dynamic>;
    static public function mergeOptions(id : String, options : NavigationOptions) : Void;
    // others
    static public function setDefaultOptions(options : NavigationOptions) : Void;
    static public function constants() : js.Promise<NavigationConstants>;
    static public function getLaunchArgs() : js.Promise<Dynamic>;
}
