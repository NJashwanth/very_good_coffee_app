import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/next_image_button.dart';

// Mocking HomeBloc to avoid real implementation
class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late HomeBloc homeBloc;

  setUpAll(() {
    // Initialize the mock HomeBloc
    homeBloc = MockHomeBloc();
    when(() => homeBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => homeBloc.state).thenReturn(CoffeeLoadingState());
  });

  testWidgets('NextImageButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeBloc>.value(
          value: homeBloc,
          child: const Scaffold(
            body: NextImageButton(),
          ),
        ),
      ),
    );

    // Verify if the button's text and icon are displayed
    expect(find.textContaining('Next Photo'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  testWidgets('NextImageButton triggers LoadCoffeeEvent on tap',
      (WidgetTester tester) async {
    when(() => homeBloc.add(const LoadCoffeeEvent())).thenAnswer(
        (_) => Future.value(CoffeeLoadedState(coffeeModel: CoffeeModel())));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeBloc>.value(
          value: homeBloc,
          child: const Scaffold(
            body: NextImageButton(),
          ),
        ),
      ),
    );

    // Simulate a tap on the button
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    // Verify if the LoadCoffeeEvent is triggered
    verify(() => homeBloc.add(const LoadCoffeeEvent())).called(1);
  });
}
