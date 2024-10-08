// Mocks generated by Mockito 5.4.4 from annotations
// in finalproject/test/unit_test/unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:finalproject/core/failure/failure.dart' as _i5;
import 'package:finalproject/features/auth/domain/entity/auth_entity.dart'
    as _i6;
import 'package:finalproject/features/auth/domain/usecases/auth_usecase.dart'
    as _i3;
import 'package:finalproject/features/auth/presentation/navigator/login_navigator.dart'
    as _i7;
import 'package:finalproject/features/auth/presentation/navigator/register_navigator.dart'
    as _i8;
import 'package:finalproject/features/profile/domain/entity/profile_entity.dart'
    as _i12;
import 'package:finalproject/features/profile/domain/repository/profile_repository.dart'
    as _i11;
import 'package:finalproject/features/rateAndReview/domain/entity/review_entity.dart'
    as _i10;
import 'package:finalproject/features/rateAndReview/domain/repository/review_repository.dart'
    as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthUseCase extends _i1.Mock implements _i3.AuthUseCase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> registerUser(
          _i6.AuthEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #registerUser,
            [user],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #registerUser,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> loginUser(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}

/// A class which mocks [LoginViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginViewNavigator extends _i1.Mock
    implements _i7.LoginViewNavigator {}

/// A class which mocks [RegisterViewNavigator].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterViewNavigator extends _i1.Mock
    implements _i8.RegisterViewNavigator {}

/// A class which mocks [ReviewRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReviewRepository extends _i1.Mock implements _i9.ReviewRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> createReview(
    String? productId,
    double? rating,
    String? comment,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createReview,
          [
            productId,
            rating,
            comment,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #createReview,
            [
              productId,
              rating,
              comment,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #createReview,
            [
              productId,
              rating,
              comment,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, List<_i10.ReviewEntity>>> getProductReviews(
          String? productId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductReviews,
          [productId],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i10.ReviewEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i10.ReviewEntity>>(
          this,
          Invocation.method(
            #getProductReviews,
            [productId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i10.ReviewEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i10.ReviewEntity>>(
          this,
          Invocation.method(
            #getProductReviews,
            [productId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i10.ReviewEntity>>>);
}

/// A class which mocks [IProfileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIProfileRepository extends _i1.Mock
    implements _i11.IProfileRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i12.ProfileEntity>> getUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i12.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i12.ProfileEntity>(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i12.ProfileEntity>>.value(
                _FakeEither_0<_i5.Failure, _i12.ProfileEntity>(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i12.ProfileEntity>>);
}
