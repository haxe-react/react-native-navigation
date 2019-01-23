package react.native.navigation;

extern class EmitterSubscription {
    public function remove() : Void;
}

typedef NavCommandArgument = {
    commandId: NavCommand,
    completionTime: Float,//?
    params: Dynamic,
}

@:enum 
abstract NavCommand(String) {
    var SetRoot = "setRoot";
    var SetStackRoot = "setStackRoot";
    var Push = "push";
    var Pop = "pop";
    var PopTo = "popTo";
    var PopToRoot = "popToRoot";
    var ShowModal = "showModal";
    var DismissModal = "dismissModal";
    var DismissAllModals = "dismissAllModals";
    var ShowOverlay = "showOverlay";
    var DismissOverlay = "dismissOverlay";
}

extern class EventsRegistry {
    public function registerAppLaunchedListener(cb : Void -> Void) : EmitterSubscription;
    public function registerComponentDidAppearListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerComponentDidDisappearListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerCommandListener(cb : (NavCommandArgument -> Void)) : EmitterSubscription;
    public function registerCommandCompletedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerBottomTabSelectedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerNavigationButtonPressedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerModalDismissedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerSearchBarUpdatedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerSearchBarCancelPressedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function registerPreviewCompletedListener(cb : Dynamic -> Void) : EmitterSubscription;
    public function bindComponent(cmp : Dynamic) : EmitterSubscription; // should we type cmp ?
}
