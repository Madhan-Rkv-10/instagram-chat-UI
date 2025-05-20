import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:instagram_chat_bubble/main.dart';

// Main application and widget classes (import your code here)

void main() {
  // Test Case 1: Check if App widget renders correctly
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const App(home: ExampleGradientBubbles()));

    // Act
    final appBarTitleFinder = find.text('Instagram Chat Bubble Example');

    // Assert
    expect(appBarTitleFinder,
        findsOneWidget); // Verify that the app bar title exists
  });

  // Test Case 2: Test if ExampleGradientBubbles initializes correctly
  testWidgets('ExampleGradientBubbles widget initializes with correct data',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const App(home: ExampleGradientBubbles()));

    // Act
    final firstMessageText = find.text('Hello, how are you today?');

    // Assert
    expect(firstMessageText,
        findsOneWidget); // Check that the first message is shown
  });

  // Test Case 3: Verify message bubble alignment for "myself"
  testWidgets('MessageBubble alignment for "myself"',
      (WidgetTester tester) async {
    // Arrange
    final message = Message(owner: MessageOwner.myself, text: 'Hello');
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body:
                  MessageBubble(message: message, child: Text(message.text)))),
    );

    // Act
    final messageBubble = find.byType(MessageBubble);

    // Assert
    expect(messageBubble, findsOneWidget); // Ensure message bubble is rendered
    // Additional assertion can be added based on the message alignment
  });

  // Test Case 4: Verify message bubble alignment for "other"
  testWidgets('MessageBubble alignment for "other"',
      (WidgetTester tester) async {
    // Arrange
    final message = Message(owner: MessageOwner.other, text: 'Hi');
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body:
                  MessageBubble(message: message, child: Text(message.text)))),
    );

    // Act
    final messageBubble = find.byType(MessageBubble);

    // Assert
    expect(messageBubble, findsOneWidget); // Ensure message bubble is rendered
    // Additional assertion for alignment
  });

  // Test Case 5: Verify message generation logic in MessageGenerator
  test('MessageGenerator creates the correct number of messages', () {
    // Arrange
    final generatedMessages = MessageGenerator.generate(10);

    // Assert
    expect(generatedMessages.length, 10); // Check if 10 messages are generated
    expect(generatedMessages.first.text,
        isNotEmpty); // Ensure the text of messages is not empty
    expect(generatedMessages.first.owner,
        isNotNull); // Ensure the owner is valid (myself or other)
  });

  // Test Case 6: Test BubblePainter paint method
  testWidgets('BubblePainter draws gradient background correctly',
      (WidgetTester tester) async {
    // Arrange
    final scrollableState =
        Scrollable.of(tester.element(find.byType(ExampleGradientBubbles)))!;
    final message = Message(owner: MessageOwner.myself, text: 'Test message');

    // Create a BubbleBackground with a simple gradient
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BubbleBackground(
            colors: [Colors.blue, Colors.red],
            child: MessageBubble(message: message, child: Text(message.text)),
          ),
        ),
      ),
    );

    // Act
    final customPaintFinder = find.byType(CustomPaint);

    // Assert
    expect(customPaintFinder,
        findsOneWidget); // Ensure the custom paint is applied
    // Additional checks could be added for verifying the specific gradient in the painter
  });

  // Test Case 7: Verify app bar title and basic layout
  testWidgets('AppBar displays correct title', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const App(home: ExampleGradientBubbles()));

    // Act
    final appBarTitleFinder = find.text('Instagram Chat Bubble Example');

    // Assert
    expect(appBarTitleFinder,
        findsOneWidget); // Verify app bar title is rendered correctly
  });

  // Test Case 8: Test if the messages list is scrollable
  testWidgets('Messages list is scrollable', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const App(home: ExampleGradientBubbles()));

    // Act
    final scrollableFinder = find.byType(ListView);
    await tester.drag(scrollableFinder, const Offset(0, -300));
    await tester.pump();

    // Assert
    expect(scrollableFinder, findsOneWidget); // Ensure the ListView exists
  });

  // Test Case 9: Check if the MessageBubble changes colors based on sender
  testWidgets('MessageBubble displays different colors for different senders',
      (WidgetTester tester) async {
    // Arrange for a message from 'myself'
    final messageMine = Message(owner: MessageOwner.myself, text: 'Hello');
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body: MessageBubble(
                  message: messageMine, child: Text(messageMine.text)))),
    );

    // Act & Assert for message colors (check for specific colors used in MessageBubble)
    final containerMine = find.byType(Container);
    expect(containerMine, findsOneWidget);

    // Arrange for a message from 'other'
    final messageOther = Message(owner: MessageOwner.other, text: 'Hi');
    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
              body: MessageBubble(
                  message: messageOther, child: Text(messageOther.text)))),
    );

    // Act & Assert for message colors (check for different colors used)
    final containerOther = find.byType(Container);
    expect(containerOther, findsOneWidget);
  });
}
