<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instagram Chat Bubble Example</title>
</head>
<body>
    <h1>Instagram Chat Bubble Example</h1>
    <p>This Flutter project demonstrates how to create gradient chat bubbles similar to Instagram's chat design. The app dynamically generates messages to display the bubbles with varying gradient colors based on the message owner.</p>
    <h2>Project Structure</h2>
    <ul>
        <li><strong>lib/main.dart:</strong> Contains the main code for rendering the chat bubbles.</li>
        <li><strong>assets:</strong> A folder containing GIFs to showcase the app's output.</li>
    </ul>
    <h2>Features</h2>
    <ul>
        <li>Gradient background chat bubbles with customizable colors.</li>
        <li>Dynamic message generation with random text.</li>
        <li>Reverse scrolling for a chat-like experience.</li>
    </ul>
    <h2>How to Run</h2>
    <ol>
        <li>Clone or download the repository to your local machine.</li>
        <li>Ensure you have Flutter installed. For installation instructions, visit <a href="https://flutter.dev/docs/get-started/install">Flutter Install Guide</a>.</li>
        <li>Navigate to the project directory.</li>
        <li>Run the following command to fetch dependencies:
            <pre><code>flutter pub get</code></pre>
        </li>
        <li>Start the application with:
            <pre><code>flutter run</code></pre>
        </li>
    </ol>
    <h2>Demo</h2>
    <p>The app creates visually appealing chat bubbles. Below is a GIF showing the application's output:</p>
    <img src="assets/demo.gif" alt="App Output" style="max-width: 100%; border: 1px solid #ddd; padding: 5px;">
    <h2>Customization</h2>
    <p>You can customize the chat bubble colors and messages by modifying:</p>
    <ul>
        <li><strong>Colors:</strong> Update the <code>colors</code> array in the <code>MessageBubble</code> widget.</li>
        <li><strong>Messages:</strong> Modify the <code>_exampleData</code> list in the <code>MessageGenerator</code> class.</li>
    </ul>
    <h2>Dependencies</h2>
    <ul>
        <li><strong>Flutter:</strong> Ensure the latest stable version is installed.</li>
    </ul>
    <h2>Contributing</h2>
    <p>If you'd like to contribute to this project, feel free to submit a pull request or report issues via the GitHub repository.</p>
    <h2>License</h2>
    <p>This project is licensed under the MIT License.</p>
</body>
</html>
