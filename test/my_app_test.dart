import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab15/main.dart';  

void main() {
  testWidgets('Test calculation function', (WidgetTester tester) async {
   
    final myHomePage = MyHomePageState();

   
    expect(myHomePage.calculate(3), closeTo(0.6, 0.001)); 
    expect(() => myHomePage.calculate(2), throwsArgumentError);
    expect(() => myHomePage.calculate(-2), throwsArgumentError);
  });

  testWidgets('Test UI title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());  
    
    expect(find.text('ІПЗ-33: Andriy\'s last Flutter App'), findsOneWidget);
  });

  testWidgets('Test FloatingActionButton presence and icon', (WidgetTester tester) async {
   
    await tester.pumpWidget(MyApp());  

   
    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    final icon = find.byIcon(Icons.pets);
    expect(icon, findsOneWidget);
  });

  testWidgets('Test counter increment', (WidgetTester tester) async {
    
    await tester.pumpWidget(MyApp()); 

   
    expect(find.text('Counter value: 0'), findsOneWidget);

    
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

   
    expect(find.text('Counter value: 7'), findsOneWidget);  
  });
}
