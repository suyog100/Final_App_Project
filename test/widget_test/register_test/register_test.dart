import 'package:dartz/dartz.dart';
import 'package:finalproject/app/navigator_key/navigator_key.dart';
import 'package:finalproject/core/failure/failure.dart';
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart';
import 'package:finalproject/features/auth/domain/usecases/auth_usecase.dart';
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart';
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart';
import 'package:finalproject/features/auth/presentation/view/register_view.dart';
import 'package:finalproject/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../unit_test/unit_test.mocks.dart';

void main() {
  late AuthUseCase mockAuthUsecase;

  late RegisterViewNavigator mockRegisterViewNavigator;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();

    mockRegisterViewNavigator = MockRegisterViewNavigator();
  });

  testWidgets('register a new user and check whether login view opens or not',
      (tester) async {
    const username = 'Name';
    const correctEmail = 'newuser@example.com';
    const correctPassword = 'newuser123';
    const correctConfirmPassword = 'newuser123';

    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) {
      final user = invocation.positionalArguments[0] as AuthEntity;
      return Future.value(
          user.email == correctEmail && user.password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Registration failed')));
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(
              ref.read(loginViewNavigatorProvider),
              mockAuthUsecase,
              mockRegisterViewNavigator,
            ),
          ),
        ],
        child: MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'BeSushi Pokebowl',
          home: const RegisterView(),
        ),
      ),
    );

    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), username);
    await tester.enterText(find.byType(TextFormField).at(1), correctEmail);
    await tester.enterText(find.byType(TextFormField).at(2), correctPassword);
    await tester.enterText(
        find.byType(TextFormField).at(3), correctConfirmPassword);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));

    await tester.pumpAndSettle();

    // Check if the registration was successful by verifying if the LoginView is displayed
    expect(find.text('Login Here !'), findsOneWidget);
  });

  testWidgets('display error messages for empty fields on form submission',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(ref.read(loginViewNavigatorProvider),
                mockAuthUsecase, mockRegisterViewNavigator),
          ),
        ],
        child: MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'BeSushi Pokebowl',
          home: const RegisterView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));

    await tester.pump();

    expect(find.text('Please fill all fields'), findsOneWidget);
  });

  testWidgets('display error message when passwords do not match',
      (tester) async {
    const fullName = 't3';
    const email = 't3@gmail.com';
    const password = 'password123';
    const confirmPassword = 'password321';

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(ref.read(loginViewNavigatorProvider),
                mockAuthUsecase, mockRegisterViewNavigator),
          ),
        ],
        child: MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'BeSushi Pokebowl',
          home: const RegisterView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), fullName);
    await tester.enterText(find.byType(TextFormField).at(1), email);
    await tester.enterText(find.byType(TextFormField).at(2), password);
    await tester.enterText(find.byType(TextFormField).at(3), confirmPassword);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));

    await tester.pump();

    expect(find.text('Passwords do not match'), findsOneWidget);
  });
}
