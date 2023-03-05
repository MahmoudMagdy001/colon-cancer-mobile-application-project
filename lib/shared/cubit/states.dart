abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppChangeSuffixIconLogin extends AppStates {}

class AppChangeSuffixIconSignup extends AppStates {}

class AppGetCancerLoadingState extends AppStates {}

class AppGetCancerSuccessState extends AppStates {}

class AppGetCancerErrorState extends AppStates {
  final String error;

  AppGetCancerErrorState(this.error);
}

class AppBottomNavState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class AppPickImage extends AppStates {}

class AppChangeGender extends AppStates {}

class AppChangeCheckBoxGeneticDisease extends AppStates {}

class AppChangeCheckBoxSmooking extends AppStates {}

class AppCreateDataBaseState extends AppStates {}

class AppGetDataBaseLoadingState extends AppStates {}

class AppGetDataBaseState extends AppStates {}

class AppInsertDataBaseState extends AppStates {}

class AppUpdateDataBaseState extends AppStates {}

class AppDeleteDataBaseState extends AppStates {}

class AppChangeHeightState extends AppStates {}

class AppPlusAgeState extends AppStates {}

class AppMinusAgeState extends AppStates {}

class AppPlusWeightState extends AppStates {}

class AppMinusWeightState extends AppStates {}

class AppChangeRadio extends AppStates {}
