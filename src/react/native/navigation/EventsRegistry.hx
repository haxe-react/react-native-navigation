package react.native.navigation;

extern class EmitterSubscription {
    public function remove() : Void;
}

extern class EventsRegistry {
    public function registerAppLaunchedListener(cb : Void -> Void) : EmitterSubscription;
    public function registerComponentDidAppearListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerComponentDidDisappearListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerCommandListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerCommandCompletedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerBottomTabSelectedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerNavigationButtonPressedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerModalDismissedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerSearchBarUpdatedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerSearchBarCancelPressedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerPreviewCompletedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function bindComponent(cmp : Dynamic) : EmitterSubscription; // should we type cmp ?
}
