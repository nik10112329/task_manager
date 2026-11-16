import 'package:flutter/material.dart';

import 'package:task_manager/app/dependencies/dependencies.dart';

extension ContextExtensions on BuildContext {
  Dependencies get dependencies => Dependencies.of(this);
}
