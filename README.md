Documentación del Proyecto Bjumper test

Suponiendo que ya se cuenta con el framework flutter instalado. De no ser asi, proporciono el link a la documentacion oficial 

url = https://docs.flutter.dev/get-started/install

Luego de su respectiva instalacion, podremos continuar:


Instalacion del proyecto

En una terminal o powerShell clonar el proyecto
git clone https://github.com/rodrigoBak-flutter/Bjumper_Mobile_Test.git

 ---  Esperar a que el proceso haya concluido  ---

Desde la terminar hacer un cd proyecto o si se quiere se puede utilizar la terminal integrada de algun IDE, ejemplo Visual Studio Code.
Abrir dicha terminal con cmd+j en Mac y Ctrl+j en windows

Ejecutar = flutter pub get 
Para asegurarnos que se instalen las dependencias el proyecto.

Ejecucion del proyecto

Opcion 1
Desde la carpeta "lib", abriendo el archivo main.dart podemos presionar la tecla F5 (recuerde siempre tener un emulador corriendo), de lo contrario se ejecutara en web.

Opcion 2
Por linea de comando en la terminal integrada podremos ejecutar "flutter run".

Opcion 3
En este caso puntual al ser un test no fue necesario preparar varios entornos, pero en proyectos reales la preparacion de entornos es fundamental.
Dentro de la carpeta cli vamos a encontrar dev.bat que contiene esta linea de comando flutter run --dart-define-from-file=env/dev.json denotando que si la ejecutamos vamos a estar construyendo la aplicacion en el entorno de desarrollo(dev).
 
Para correr dicho comando en este caso se debe ejecutar ".\cli\dev.bat" en nuestra terminal integrada o si estoy en otra terminal siempre dentro del proyecto.
En un futuro esto se puede extender a pre y pro o incluiso mas entornos.


Estructura de carpetas del proyecto

lib/
├── app/                        # Configuraciones globales
│   ├── di/                     # Inyección de dependencias
│   ├── routes/                 # Configuración de las rutas de navegación
│   └── l10n/                   # Gestión de localización y traducción
├── core/                       # Mixin, manejo de errores globales, extensiones
├── data/                       # Implementaciones específicas de acceso a datos
│   ├── models/                 # Modelos de datos
│   ├── repositories/           # Repositorios de datos
│   └── datasources/            # Implementación de servicios de red
├── domain/                     # Definición de entidades, casos de uso y abstracciones
│   ├── entities/               # Modelos de dominio puros
│   ├── use_cases/              # Casos de uso
│   └── repositories/           # Interfaces de repositorios
├── presentation/               # Capa de interfaz de usuario
│   ├── features/               # Módulos y pantallas organizadas por funcionalidad
│   │   └── feature_x/
│   │       ├── view_model.dart # Lógica de UI y manejo de estado
│   │       ├── screens.dart    # Controlador de la vista (si es necesario)
│   │       └── widgets/        # Widgets específicos de la pantalla
│   └── shared/                 # Componentes reutilizables como animaciones o logo de Bjumper
│           └── animations/        
│           └── svg/         
│
│── main.dart



1. app/
Contiene configuraciones globales esenciales para el proyecto:

di/: Configuración de inyección de dependencias utilizando riverpod.
routes/: Define rutas de navegación utilizando Navigator(personalizado).
l10n/: Gestión de internacionalización y localización con flutter_localizations.
2. core/
Provee utilidades compartidas, Mixin, manejo de errores globales, extensiones que se utilizan en todo el proyecto.

3. data/
La capa de datos contiene implementaciones específicas para obtener información de APIs.
GET = https://api.github.com/users/octocat (usarios).
GET = https://api.github.com/users/octocat/repos (rerpositorios).  

Documentacion seguida para la realizacion de este test = https://docs.github.com/en/rest?apiVersion=2022-11-28.
Pruebas realizadas en POSTMAN.

models/: Estructuras de datos para mapeo de JSON.
repositories/: Implementación de repositorios que interactúan con APIs.
services/: Servicios para realizar peticiones HTTPS.

4. domain/
Define la lógica de negocio pura y es independiente de la infraestructura.

entities/: Clases inmutables que representan objetos de negocio.
use_cases/: Clases que implementan reglas de negocio.
repositories/: Interfaces para repositorios que se implementan en la capa data.

5. presentation/
Maneja la lógica de interfaz de usuario y la interacción con el usuario.

features/: Cada módulo o funcionalidad tiene su propio directorio.
view_models/: Gestiona el estado y la lógica específica de la vista.
shared/: Componentes reutilizables.

4. Patrones y Herramientas Utilizadas
MVVC (Model-View-ViewModel-Controller): Patrones para desacoplar lógica de negocio, datos y UI.
Inyección de Dependencias (DI): Utiliza riverpod para manejar las dependencias.
Gestión de Estado: riverpod para una gestión reactiva y segura de los estados.
Rutas de Navegación: Implementación de navegación con Navigator.

5. Reglas de Dependencia seguidas en este proyecto de Bjumper
Cada capa sigue estrictas reglas de dependencia:

La capa presentation puede depender de domain, pero nunca directamente de data.
domain es independiente de data y presentation.
La capa data puede depender de core para utilidades compartidas, pero no de presentation.

Hay un analizador de que la arquitectura que se encuentra en cli/architecture_scan.dart que nos sirve para realizar las realizar las pruebas de las capas y ver su grado de relacion.




Splash Screen
[url=https://postimg.cc/R3FkPwYm][img]https://i.postimg.cc/R3FkPwYm/Screenshot-1737471990.png[/img][/url]


Home Screen
[url=https://postimg.cc/JHbvyxsN][img]https://i.postimg.cc/JHbvyxsN/Screenshot-1737471997.png[/img][/url]

Loading  
[url=https://postimg.cc/XZzTtpMC][img]https://i.postimg.cc/XZzTtpMC/Screenshot-1737472007.png[/img][/url]

Data
[url=https://postimg.cc/zHm4X6GD][img]https://i.postimg.cc/zHm4X6GD/Screenshot-1737472009.png[/img][/url]

Error user
[url=https://postimg.cc/N92WtBYP][img]https://i.postimg.cc/N92WtBYP/Screenshot-1737472021.png[/img][/url]


