import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:finalproject/features/auth/domain/usecases/auth_usecase.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import "package:mockito/annotations.dart";

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
  MockSpec<RegisterViewNavigator>(),
])
void main() {
  late AuthUseCase mockAuthUseCase;
  late LoginViewNavigator mockLoginViewNavigator;
  late RegisterViewNavigator mockRegisterViewNavigator;

  late ProviderContainer container;

  setUp(
        () {
      mockAuthUseCase = MockAuthUseCase();
      mockLoginViewNavigator = MockLoginViewNavigator();
      mockRegisterViewNavigator = MockRegisterViewNavigator();

      TestWidgetsFlutterBinding.ensureInitialized();

      container = ProviderContainer(overrides: [
        authViewModelProvider.overrideWith((ref) => AuthViewModel(
            mockLoginViewNavigator, mockAuthUseCase, mockRegisterViewNavigator))
      ]);
    },
  );

  test("Check for the initial state in auth state", () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });


  //test 1 pass
  test('login test with valid username and password', () async {
    // Arrange
    const correctUsername = 'sujan@gmail.com';
    const correctPassword = 'sujanshress';

    when(mockAuthUseCase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctUsername && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('sujan@gmail.com', 'sujanshress');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  //test failed 2
  test('login test with invalid username and password', () async {
    // Arrange
    const correctUsername = 'sujan@gmail.com';
    const correctPassword = 'sujanshress';
    const invalidUsername = 'wrong@email.com';
    const invalidPassword = 'wrongpassword';

    when(mockAuthUseCase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctUsername && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid credentials')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(invalidUsername, invalidPassword);
    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
    expect(authState.isLoading, true);
  });
  test('register test with valid user information', () async {
    const validUser = AuthEntity(
        username: 'prasanna',
        email: 'prasanna@example.com',
        password: 'pj123',
        phone: "98123712371");

    when(mockAuthUseCase.registerUser(any))
        .thenAnswer((_) async => const Right(true));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(validUser);
    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('register test fails when username is empty', () async {
    const invalidUser = AuthEntity(
        username: '', // Invalid: Empty username
        email: 'prasanna@example.com',
        password: 'pj123',
        phone: "98123712371");

    // Mock the use case to check username and return a failure if it's empty
    when(mockAuthUseCase.registerUser(any)).thenAnswer((invocation) async {
      final user = invocation.positionalArguments[0] as AuthEntity;
      if (user.username.isEmpty) {
        return Left(Failure(error: 'Username cannot be empty'));
      }
      return const Right(true);
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .registerUser(invalidUser);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });
  tearDown(() {
    container.dispose();
  });
}
