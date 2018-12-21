package react.native.navigation;

typedef Layout = {
    ? component : ComponentLayout,
    ? stack : StackLayout,
    ? bottomTabs : TabsLayout,
    ? sideMenu : SideMenuLayout,
#if ios
    ? splitView : SplitViewLayout,
#end
}

typedef ComponentLayout = {
    ? id : String,
    name : String,
    ? passProps : Dynamic,
    ? options : NavigationOptions,
}

typedef StackLayout = {
    ? id : String,
    children : Array<Layout>,
    ? options : NavigationOptions,
}

typedef TabsLayout = {
    ? id : String,
    children : Array<Layout>,
    ? options : NavigationOptions,
}

typedef SideMenuLayout = {
    ? left : Layout,
    ? center : Layout,
    ? right : Layout,
}

#if ios
typedef SplitViewLayout = {
    ? id : String,
    master : Layout,
    detail : Layout,
    ? options: react.native.navigation.NavigationOptions.SplitViewOptions,
}
#end