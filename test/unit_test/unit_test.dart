import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:finalproject/features/auth/domain/usecases/auth_usecase.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:finalproject/features/profile/domain/entity/profile_entity.dart';
import 'package:finalproject/features/profile/domain/repository/profile_repository.dart';
import 'package:finalproject/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:finalproject/features/rateAndReview/domain/repository/review_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<RegisterViewNavigator>(),
  MockSpec<ReviewRepository>(),
  MockSpec<IProfileRepository>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late LoginViewNavigator mockLoginViewNavigator;
  late RegisterViewNavigator mockRegisterViewNavigator;
  late ProviderContainer container;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    mockRegisterViewNavigator = MockRegisterViewNavigator();

    TestWidgetsFlutterBinding.ensureInitialized();

    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
        (ref) => AuthViewModel(
            mockLoginViewNavigator, mockAuthUsecase, mockRegisterViewNavigator),
      ),
    ]);
  });

// checking for initial state
  test('check for the initial state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

// login test passeddddd
  test('login test with valid data', () async {
    const correctEmail = 'lalit@gmail.com';
    const correctPassword = 'lalit@123';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(email == correctEmail && password == correctPassword
          ? const Right(true)
          : Left(Failure(error: 'Invalid')));
    });
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('lalit@gmail.com', 'lalit@123');
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  // login test fail
  test('login test with invalid data', () async {
    const correctEmail = 'sompal@gmail.com';
    const correctPassword = 'sompal';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(email == correctEmail && password == correctPassword
          ? const Right(true)
          : Left(Failure(error: 'Invalid')));
    });
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('sompal@gmail.com', 'sompal123');
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  // register test passed doonee
  test('registration test with valid data', () async {
    const correctUser = AuthEntity(
        username: 'lalit',
        email: 'lalit@gmail.com',
        password: 'lalit@123',
        phone: "123456");

    when(mockAuthUsecase.registerUser(correctUser)).thenAnswer((invocation) {
      final user = invocation.positionalArguments[0] as AuthEntity;
      return Future.value(user.email == correctUser.email &&
              user.password == correctUser.password &&
              user.username == correctUser.username
          ? const Right(true)
          : Left(Failure(error: 'Invalid')));
    });

    await container
        .read(authViewModelProvider.notifier)
        .registerUser(correctUser);
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

// register test failiedddddd
  test('registration test with invalid data', () async {
    const correctUser = AuthEntity(
        username: 'lalit',
        email: 'lalit@gmail.com',
        password: 'lalit@123',
        phone: "9848576962");
    const incorrectUser = AuthEntity(
        username: 'lalit',
        email: 'lalit@gmail.com',
        password: 'lalit123',
        phone: "9848576962");

    when(mockAuthUsecase.registerUser(correctUser)).thenAnswer((invocation) {
      final user = invocation.positionalArguments[0] as AuthEntity;
      return Future.value(user.email == correctUser.email &&
              user.password == correctUser.password &&
              user.username == correctUser.username
          ? const Right(true)
          : Left(Failure(error: 'Invalid')));
    });

    await container
        .read(authViewModelProvider.notifier)
        .registerUser(incorrectUser);
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  group('Authentication Group', () {
//login test with valid data passedddd
    test('login test with valid data', () async {
      const correctEmail = 'lalit@gmail.com';
      const correctPassword = 'lalit@123';

      when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        return Future.value(email == correctEmail && password == correctPassword
            ? const Right(true)
            : Left(Failure(error: 'Invalid')));
      });
      await container
          .read(authViewModelProvider.notifier)
          .loginUser('lalit@gmail.com', 'lalit@123');
      final authState = container.read(authViewModelProvider);
      expect(authState.error, isNull);
    });

    // login test fail
    test('login test with invalid data', () async {
      const correctEmail = 'lalit@gmail.com';
      const correctPassword = 'lali';

      when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
        final email = invocation.positionalArguments[0] as String;
        final password = invocation.positionalArguments[1] as String;
        return Future.value(email == correctEmail && password == correctPassword
            ? const Right(true)
            : Left(Failure(error: 'Invalid')));
      });
      await container
          .read(authViewModelProvider.notifier)
          .loginUser('lalit@gmail.com', 'lalit@123');
      final authState = container.read(authViewModelProvider);
      expect(authState.error, isNull);
    });
  });

  // // testing for rate and review
  // group('Rate and Review Usecase Tests', () {
  //   late ReviewRepository mockReviewRepository;
  //   late CreateReviewUseCase createReviewUseCase;
  //   late GetProductReviewsUseCase getProductReviewsUseCase;

  //   setUp(() {
  //     mockReviewRepository = MockReviewRepository();
  //     createReviewUseCase =
  //         CreateReviewUseCase(repository: mockReviewRepository);
  //     getProductReviewsUseCase =
  //         GetProductReviewsUseCase(repository: mockReviewRepository);
  //   });

  //   test('should create a review successfully', () async {
  //     const productId = '123';
  //     const rating = 4.5;
  //     const comment = 'Great product!';

  //     when(mockReviewRepository.createReview(productId, rating, comment))
  //         .thenAnswer((_) async => const Right(true));

  //     final result = await createReviewUseCase(productId, rating, comment);

  //     expect(result, const Right(true));
  //     verify(mockReviewRepository.createReview(productId, rating, comment))
  //         .called(1);
  //   });
  //   test('should return product reviews successfully', () async {
  //     const productId = '123';
  //     final reviewList = [
  //       ReviewEntity(
  //         id: '1',
  //         productId: '123',
  //         userId: 'user1',
  //         userName: 'User One',
  //         rating: 4.5,
  //         comment: 'Great product!',
  //         createdAt: DateTime.parse('2022-01-01'),
  //       ),
  //     ];

  //     when(mockReviewRepository.getProductReviews(productId))
  //         .thenAnswer((_) async => Right(reviewList));

  //     final result = await getProductReviewsUseCase(productId);

  //     expect(result, Right(reviewList));
  //     verify(mockReviewRepository.getProductReviews(productId)).called(1);
  //   });
  // });

  // Profile tests

//prfofil test passedddddd
  group('Profile Usecase Tests', () {
    late IProfileRepository mockProfileRepository;
    late ProfileUsecase profileUsecase;

    setUp(() {
      mockProfileRepository = MockIProfileRepository();
      profileUsecase = ProfileUsecase(profileRepository: mockProfileRepository);
    });

//succesful profile fetch passedddd
    test('should return ProfileEntity on successful fetch', () async {
      const profileEntity = ProfileEntity(
        userId: '1',
        username: 'Lalit ',
        email: 'lalit@gmail.com',
        profileImage: 'path/to/image.jpg',
        phone: "9848576962",
      );

      when(mockProfileRepository.getUser())
          .thenAnswer((_) async => const Right(profileEntity));

      final result = await profileUsecase.getUser();

      expect(result, const Right(profileEntity));
      verify(mockProfileRepository.getUser()).called(1);
    });
  });

  tearDown(() {
    container.dispose();
  });
}
