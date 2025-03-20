# Flutter-App

Link hacia la Wiki del equipo https://github.com/ISIS-3510-G42/Backend-App/wiki/Home-%E2%80%90-ISIS3510-Documentation


### Esta sera la estructura de archivos que usaremos como base

#### NOTE: las carpetas android,ios,web,windows,macos,linux no se TOCAN!

lib/
┣ domain/
│   ┣ models/
│   │   ┣ user.dart
│   │   ┗ post.dart
│   ┗ use_cases/
│       ┣ create_post_use_case.dart
│       ┗ get_posts_use_case.dart
┣ data/
│   ┣ datasources/
│   │   ┣ local/
│   │   │   ┗ local_storage.dart
│   │   ┗ remote/
│   │       ┣ api_service.dart
│   │       ┗ firebase_service.dart
│   ┗ repositories/
│       ┣ user_repository.dart
│       ┗ post_repository.dart
┣ ui/
│   ┣ viewmodels/
│   │   ┣ login_viewmodel.dart
│   │   ┣ register_viewmodel.dart
│   │   ┗ home_viewmodel.dart
│   ┣ views/
│   │   ┣ login_page.dart
│   │   ┣ register_page.dart
│   │   ┣ home_page.dart
│   │   ┗ ...
│   ┣ widgets/
│   │   ┗ ...
│   ┗ app.dart
┣ services/
│   ┣ analytics_service.dart
│   ┣ location_service.dart
│   ┗ camera_service.dart
┣ main.dart
┗ router.dart   (opcional)

este proyecto usa gitflow, aqui como usarlo

Consulta la guía de uso de GitFlow Lite [aquí](./Readme_gitflow_lite.md).
