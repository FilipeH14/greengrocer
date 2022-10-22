String authErrorString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastrar usuário: nome inválido';
    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar usuário: celular inválido';
    case 'INVALID_CPF ':
      return 'Ocorreu um erro ao cadastrar usuário: cpf inválido';
    default:
      return 'um erro indefinido ocorreu';
  }
}
