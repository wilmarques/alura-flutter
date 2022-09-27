import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 1000, isAuthenticated: true));

  try {
    // Fazendo transferência
    bool result = bankController.makeTransfer(
        idSender: "Kako222", idReceiver: "Ricarth", amount: 700);

    // Observando resultado
    print(result);
  } on SenderIdInvalidException catch (e) {
    print('O ID ${e.idSender} do remetente não é um ID válido');
  }
}
