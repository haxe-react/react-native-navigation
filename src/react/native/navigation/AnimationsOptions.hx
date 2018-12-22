package react.native.navigation;

typedef AnimationsOptions = {
    ? setStackRoot : AnimationOptions,
    ? setRoot : AnimationOptions,
    ? push : AnimationOptions,
    ? pop : AnimationOptions,
    ? showModal : AnimationOptions,
    ? dismissModal : AnimationOptions,
}
typedef AnimationOptions = {
    > AnimationElementOptions,
    ? enabled : Bool,
    ? topBar : {
        > AnimationElementOptions,
        ? id : String,
    },
    ? bottomTabs : AnimationElementOptions,
    ? content : AnimationElementOptions,
}
typedef AnimationElementOptions = {
    ? x : AnimationParametersOptions,
    ? y : AnimationParametersOptions,
    ? alpha : AnimationParametersOptions,
    ? scaleX : AnimationParametersOptions,
    ? scaleY : AnimationParametersOptions,
    ? rotationX : AnimationParametersOptions,
    ? rotationY : AnimationParametersOptions,
    ? rotation : AnimationParametersOptions,
}
@:enum
abstract AnimationInterpolation(String) {
    var Accelerate = 'accelerate';
    var Decelerate = 'decelerate';
}
typedef AnimationParametersOptions = {
    ? from : Float, // Mandatory, initial value
    ? to : Float, // Mandatory, end value
    ? duration : Int, // Default value is 300 ms
    ? startDelay : Int, // Default value is 0
    ? interpolation : AnimationInterpolation,
}
