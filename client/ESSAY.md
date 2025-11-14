LINK: https://github.com/Schamppu/koppling

ESSAY IN EASY TO READ MARKDOWN: https://github.com/Schamppu/koppling/blob/main/README.md

INSTALLATION INSTRUCTIONS:

You need to follow your platform specific Flutter & Dart installation guide first. Koppling client & backend are developed with Flutter and Dart. Here's what you need to do:

1. Install Flutter following your platform specific guide: https://docs.flutter.dev/get-started/quick

This should also install Dart on your machine. If not, you can follow platform specific guide here:
https://dart.dev/get-dart

You need Flutter version 3.38.1.

2. Installing VSC

You need to install Visual Studio Code if you don't have it. You can download it from:
https://code.visualstudio.com/download

3. Installing the project

Clone/download the git repository that includes both the Client and the Server folders.

Then, you'll need to open two Visual Studio Codes. One for Client folder, one for the Server folder.

Alternatively you can do this with one instance of VSC, but running multiple VSC terminals.

Then, in both folders, run the following command:

`dart pub get`

This will download the dependencies.

Then, you need to run the code generator by using:

`dart run build_runner build -d`

This generates you the data classes. This must be also repeated on both projects (Server, Client).

Then, you'll need to activate Dart Frog CLI globally by running (just once):

`dart pub global activate dart_frog_cli`

Then, you'll be able to navigate with the terminal to Server folder, and run the following:

`dart_frog dev`

This launches the backend on your local machine.

Now, you should run the client on your chrome browser by running the following code in Client folder:

`flutter run` and choosing `Chrome`. You could also use different browsers, but I've only used Chrome for development.

PROJECT INFO

Koppling is a game inspired by New York Times Connections. You need to connect four words that are related to each other. On each game you have 4 groups of 4 words, and 4 lives. The game state is being synchronized with HTTP on each call between the client and the server.

Creating all of the game logic took a significant amount of extra time here, and also because Dart isn't exactly a backend language, I had to create my own backend from scratch for this project.

The client uses Web Assembly (WASM), which might act weirdly on certain browsers still as it is rather new thing.

FLAW 1: [A01 Broken Access Control]
Source link: https://github.com/Schamppu/koppling/blob/459ea20590a9cfdecaf9791a5b254081c1a1361c/server/routes/_middleware.dart#L36
Before image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-1-before.png
After image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-1-after.png

CORS management has been set up so that it has Access-Control-Allow-Origin as *. This means, that the backend can be called from any web application. The included fix there suggests that we would change it to something like https://koppling.app to avoid this issue. Even in its current state, the allowed methods and headers are listed to avoid unwated calls with certain methods or headers that we want to filter out.

You can also manipulate the URL to avoid login. To fix that, we should use an access control system such as JWT with roles, and on the backend validate that the user's session based on the JWT has access to view the route.

This could be done by adding a new _middleware to the project, that uses the Session object included in the headers to validate that it has a valid session, and each route can be protected in Dart Frog by putting the into folder where this authentication middleware is used.


FLAW 2: [A02 Cryptographic Failures]
Source link: https://github.com/Schamppu/koppling/blob/459ea20590a9cfdecaf9791a5b254081c1a1361c/client/lib/features/networking/functions/networking.dart#L27
Before image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-2-before.png
After image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-2-after.png

Data between backend and the client is transmitted through clear text. The backend on _middleware.dart includes a toggle to enable encryption, and this has been toggled false. To fix this issue, that must be toggled to true and on client side (source link) you'll need to add the encryption interceptor to the HTTP client. This way, the application will encrypt all HTTP requests between the client and backend using AES256 with an intialization vector.

This flaw is critical (unless fixed with the provided info), as man-in-the-middle attacks could easily see the credentials in plain text while logging in to the game.

FLAW 3: [A03 Injection]
Source link: https://github.com/Schamppu/koppling/blob/459ea20590a9cfdecaf9791a5b254081c1a1361c/server/main.dart#L18
Before image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-4-before.png
After image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-4-after.png

The backend's SQL doesn't use Drift library's default SQL client, but instead my own which allows of injections. Fix is commented out, as this is simply a case of not using the robust library as it's supposed to be used, and instead we do read & writes using SQL that can be easily injected.

You can try out the flaw with something like for the password:

`test' OR '1'='1`

This will return you the user, as long as you have the correct username (you can use admin for instance, as that one is automatically created as A05 flaw). You could use it in username too, or do any sort of injections.

FLAW 4: [A05 Security Misconfiguration]
Source link: https://github.com/Schamppu/koppling/blob/459ea20590a9cfdecaf9791a5b254081c1a1361c/server/main.dart#L18
Before image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-4-before.png
After image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-4-after.png

When the backend is ran, it'll add a user called with username `admin` and password `admin` to the database. Default users should not be included, and simply removing this should fix the issue.

The flaw is simply written there, but can be fixed by commenting it out. This way these default users don't get created when the backend is ran.

FLAW 5: [A07 Indentification and Authentication Failures]
Source link: https://github.com/Schamppu/koppling/blob/459ea20590a9cfdecaf9791a5b254081c1a1361c/server/routes/auth/register/index.dart#L13
Before image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-5-before.png
After image: https://github.com/Schamppu/koppling/blob/main/client/images/flaw-5-after.png

When signing up to the application, any passwords are allowed. The regex part for validating strong enough credentials has been commented out. To fix this, we should simply do more robust credential validation.

It also checks against weak passwords, using this list of 100k weakest passwords:

https://github.com/michaeloki/secure-password-utility-flutter/blob/main/lib/assets/passwds.json

The application also doesn't include password recovery, as I didn't want to setup an entire SMTP thing for this small course project. To fix that, we should allow password recovery using, for instance, magic links that allow you to one time login with a link that goes to your email and change your password then. The application doesn't allow credential management either, as those would've taken significant amount of time for this app and as it is, it can already cover these security flaws well enough.