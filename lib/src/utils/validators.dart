class Validators {
  
  String toValidateUsername(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar nombre de usuario';
    }
    if (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)) {
      return null;
    } else {
      return 'Usuario Invalido';
    }
  }

  String toValidateEmail(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar el correo electronico';
    }
    if (text.contains('@') && text.contains('.com')) {
      return null;
    } else {
      return 'El correo electronico no es valido';
    }
  }

  String toValidatePassword(String text) {
    if (text.isEmpty) {
      return 'Debe ingresar la contraseña';
    }
    if (text.isNotEmpty && text.length > 5) {
      return null;
    }
    return 'La contraseña debe ser mayor a 5 letras';
  }
}
