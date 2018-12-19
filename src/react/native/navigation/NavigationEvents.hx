package react.native.navigation;

extern class NavigationEvents {
    public function registerAppLaunchedListener(cb : Void -> Void) : Void;
    public function registerComponentDidAppearListener(cb : Dynamic -> Void) : Void;
    public function registerComponentDidDisappearListener(cb : Dynamic -> Void) : Void;
    public function registerCommandListener(cb : Dynamic -> Void) : Void;
    public function registerCommandCompletedListener(cb : Dynamic -> Void) : Void;
    public function registerBottomTabSelectedListener(cb : Dynamic -> Void) : Void;
    public function registerNavigationButtonPressedListener(cb : Dynamic -> Void) : Void;
    public function bindComponent(cmp : Dynamic) : Void; // should we type cmp ?
}
