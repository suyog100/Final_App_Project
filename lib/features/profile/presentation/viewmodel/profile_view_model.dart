import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/profile_entity.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import '../state/profile_state.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(
    ref.read(profileUsecaseProvider),
  ),
);

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel(this.profileUsecase) : super(ProfileState.initial());
  final ProfileUsecase profileUsecase;

  Future<void> fetchProfile() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUsecase.getUser();
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        print("Error: ${failure.error}");
      },
      (profile) {
        state = state.copyWith(isLoading: false, profile: profile, error: null);
        print("Profile loaded: ${profile.username}");
        print('Profile Image URL: ${profile.profileImage}');
      },
    );
  }

  // Future<bool> editProfile(ProfileEntity profile, File? imageFile) async {
  //   var result = await profileUsecase.updateProfile(profile, imageFile);
  //   return result.fold(
  //     (failure) {
  //       state = state.copyWith(error: failure.error);
  //       print("Error: ${failure.error}");
  //       return false;
  //     },
  //     (success) {
  //       fetchProfile(); // Refetch profile to update the state
  //       return true;
  //     },
  //   );
  // }
}
