# news_app

A new Flutter project.

This sample focuses more on getting the base functionality right rather than UI look.

We are using following libraries:

- provider : state management
- dio : networking
- freezed : for data models (The generated models are also commited which ideally shouldn't be)
- url_launcher : for launching URLs :)
- json_serializable : for serializing the freezed models

The app has two screen

- ArticlesScreen
- ArticleDetailScreen

The whole app is wrapped in ArticlesProvider which provides list of articles;

On ArticlesScreen screen the Top Headlines are shown.
On the second screen; the Article model is passed directly from the first screen.