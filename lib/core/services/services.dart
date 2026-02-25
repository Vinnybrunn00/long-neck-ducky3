import 'package:flutter/material.dart';
import 'package:long_neck_duck3/core/services/manager_command.dart';
import 'package:long_neck_duck3/core/services/manager_office.dart';
import 'package:long_neck_duck3/ui/utils/utils.dart';

class LongNeckDuckProvider with ChangeNotifier {
  String? _status;
  String? get status => _status;

  void configure(String content, BuildContext context) async {
    try {
      final ManagerOffice managerOfficeConfig = ManagerOffice(
        filename: 'config.xml',
        content: '$content/config.xml',
      );

      _status = 'Configurando o pacote...';
      notifyListeners();

      await managerOfficeConfig.download();

      final ManagerOffice managerOfficeSetup = ManagerOffice(
        filename: 'setup.exe',
        content: 'setup/setup.exe',
      );
      _status = 'Baixando o setup...';
      notifyListeners();

      await managerOfficeSetup.download();

      final ManagerCommand managerCommand = ManagerCommand();

      _status = 'Aguarde...';
      notifyListeners();
      await managerCommand.execCommand();

      _status = null;
    } catch (_) {
      _status = null;
      notifyListeners();
      if (!context.mounted) return;
      Utils.showErrorMessageFloating(
        context: context,
        message: 'Algo de errado aconteceu, tente novamente.',
      );
    }
  }
}
