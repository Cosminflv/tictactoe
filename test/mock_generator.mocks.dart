// Mocks generated by Mockito 5.4.2 from annotations
// in tic_tac_toe_flutter/test/mock_generator.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:tic_tac_toe_lib/src/GameInfo/piece.dart' as _i6;
import 'package:tic_tac_toe_lib/src/GameInfo/position.dart' as _i5;
import 'package:tic_tac_toe_lib/src/GameInfo/turn.dart' as _i4;
import 'package:tic_tac_toe_lib/src/igame.dart' as _i2;
import 'package:tic_tac_toe_lib/src/igame_listener.dart' as _i7;
import 'package:tic_tac_toe_lib/src/Strategy/IStrategy.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStopwatch_1 extends _i1.SmartFake implements Stopwatch {
  _FakeStopwatch_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IGame].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGame extends _i1.Mock implements _i2.IGame {
  @override
  set strategy(_i3.IStrategy? strategy) => super.noSuchMethod(
        Invocation.setter(
          #strategy,
          strategy,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set difficulty(_i3.Difficulty? difficulty) => super.noSuchMethod(
        Invocation.setter(
          #difficulty,
          difficulty,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Turn get turn => (super.noSuchMethod(
        Invocation.getter(#turn),
        returnValue: _i4.Turn.crossTurn,
        returnValueForMissingStub: _i4.Turn.crossTurn,
      ) as _i4.Turn);
  @override
  Duration get stopWatchElapsed => (super.noSuchMethod(
        Invocation.getter(#stopWatchElapsed),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#stopWatchElapsed),
        ),
        returnValueForMissingStub: _FakeDuration_0(
          this,
          Invocation.getter(#stopWatchElapsed),
        ),
      ) as Duration);
  @override
  Duration get stopWatchLimitedElapsed => (super.noSuchMethod(
        Invocation.getter(#stopWatchLimitedElapsed),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#stopWatchLimitedElapsed),
        ),
        returnValueForMissingStub: _FakeDuration_0(
          this,
          Invocation.getter(#stopWatchLimitedElapsed),
        ),
      ) as Duration);
  @override
  Stopwatch get stopWatch => (super.noSuchMethod(
        Invocation.getter(#stopWatch),
        returnValue: _FakeStopwatch_1(
          this,
          Invocation.getter(#stopWatch),
        ),
        returnValueForMissingStub: _FakeStopwatch_1(
          this,
          Invocation.getter(#stopWatch),
        ),
      ) as Stopwatch);
  @override
  Stopwatch get stopWatchLimited => (super.noSuchMethod(
        Invocation.getter(#stopWatchLimited),
        returnValue: _FakeStopwatch_1(
          this,
          Invocation.getter(#stopWatchLimited),
        ),
        returnValueForMissingStub: _FakeStopwatch_1(
          this,
          Invocation.getter(#stopWatchLimited),
        ),
      ) as Stopwatch);
  @override
  void placePiece(_i5.Pair<int, int>? p) => super.noSuchMethod(
        Invocation.method(
          #placePiece,
          [p],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void restart() => super.noSuchMethod(
        Invocation.method(
          #restart,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Piece? at(_i5.Pair<int, int>? p) => (super.noSuchMethod(
        Invocation.method(
          #at,
          [p],
        ),
        returnValueForMissingStub: null,
      ) as _i6.Piece?);
  @override
  void addListener(_i7.IGameListener? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i7.IGameListener? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool isOver() => (super.noSuchMethod(
        Invocation.method(
          #isOver,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}
