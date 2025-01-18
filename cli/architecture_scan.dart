// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

const green = '\x1b[32m';
const blue = '\x1b[36m';
const red = '\x1b[31m';
const yellow = '\x1b[33m';
const indeterminado = '\x1b[41m';
const reset = '\x1b[0m';

const warning = '$yellow⚠️$reset';
const domain = '/domain/';
const data = '/data/';
const presentation = '/presentation/';
const packageflutter = 'package:flutter/';
final configuration = [
  domain,
  data,
  presentation,
  packageflutter,
];
int incidencias = 0;
void main() async {
  final current = path.current;
  const lib = '/lib/src/';
  final proyect = '$current$lib';

  final dir = Directory(proyect);
  final files = dir.listSync(recursive: true);

  for (final file in files) {
    final isFile = file.statSync().type == FileSystemEntityType.file;
    if (!isFile) {
      continue;
    }

    checkDataLayer(file);
    checkDomainLayer(file);
    checkPresentationLayer(file);
  }

  if (incidencias > 0) {}
}

void _scanProyectFolder(
    Map<String, String> map, String directoryPath, List<String> configuration) {
  final file = File(directoryPath);

  final stat = file.statSync();
  if (stat.type == FileSystemEntityType.directory) {
    final directory = Directory(file.path);

    final libFiles = directory.listSync();
    for (final file in libFiles) {
      _addToConfigMap(file, map, configuration);
    }
  } else {
    final indexContainsAnyFilePath =
        configuration.indexWhere((e) => e.contains(file.path));
    if (indexContainsAnyFilePath > -1) {
      final construction = configuration[indexContainsAnyFilePath];
      final index = file.path.indexOf(construction);

      map.addAll({file.path.substring(index): 'true'});
    }
  }
}

_addToConfigMap(
  FileSystemEntity file,
  Map<String, String> map,
  List<String> configuration,
) {
  final stat = file.statSync();
  final filePath = file.path;

  if (stat.type == FileSystemEntityType.file) {
    final indexContainsAnyFilePath =
        configuration.indexWhere((e) => filePath.contains(e));

    if (indexContainsAnyFilePath > -1) {
      final construction = configuration[indexContainsAnyFilePath];
      final index = filePath.indexOf(construction);

      map.addAll({'package:Bjumper${file.path.substring(index)}': 'true'});
    }
  } else {
    _scanProyectFolder(map, file.path, configuration);
  }
}

checkDomainLayer(FileSystemEntity file) {
  final messages = <String>[];
  if (file.path.contains(domain)) {
    // Aplicar regla 1
    try {
      final lines = File(file.path).readAsLinesSync();
      for (final line in lines) {
        final containsPresentation = line.contains(presentation);
        final containsData = line.contains(data);
        if (containsPresentation || containsData) {
          // screaming
          final message =
              '\t${red}dependencia de la capa de ${containsData ? 'datos' : 'presentación'} => $line $reset';
          messages.add(message);
          incidencias++;
        }
      }
      if (messages.isNotEmpty) {
        for (final message in messages) {
          if (kDebugMode) {
            debugPrint(message);
          }
        }
      }
    } catch (_) {}
  }
}

checkPresentationLayer(FileSystemEntity file) {
  final messages = <String>[];
  if (file.path.contains(presentation)) {
    // Aplicar regla 3
    try {
      final lines = File(file.path).readAsLinesSync();
      for (final line in lines) {
        final containsData = line.contains(data);
        if (containsData) {
          // screaming
          final message =
              '\t${yellow}dependencia de la capa de datos => $line $reset';
          messages.add(message);
          incidencias++;
        }
      }
      if (messages.isNotEmpty) {
        for (final message in messages) {
          if (kDebugMode) {
            debugPrint(message);
          }
        }
      }
    } catch (_) {}
  }
}

checkDataLayer(FileSystemEntity file) {
  final messages = <String>[];
  if (file.path.contains(data)) {
    // Aplicar regla 3
    try {
      final lines = File(file.path).readAsLinesSync();
      for (final line in lines) {
        final containsPresentation = line.contains(presentation);
        final containsFlutter = line.contains(packageflutter);
        if (containsPresentation || containsFlutter) {
          // screaming
          final message =
              '\t${red}dependencia de la capa de presentación => $line $reset';
          messages.add(message);
          incidencias++;
        }
      }
      if (messages.isNotEmpty) {
        for (final message in messages) {
          if (kDebugMode) {
            debugPrint(message);
          }
        }
      }
    } catch (e, stack) {
      if (kDebugMode) {
        debugPrint('$e');
        debugPrint('$stack');
      }
    }
  }
}
