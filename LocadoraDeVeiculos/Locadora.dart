import 'dart:io';//import 'Locadora2.dart';
import 'Marca.dart';
import 'Modelo.dart';
import 'Cliente.dart';
import 'Locacao.dart';
import 'Veiculo.dart';
import 'Funcionario.dart';

List<Marca> marcas = [];
List<Modelo> modelos = [];
List<Veiculo> veiculos = [];
List<Cliente> clientes = [];
List<Locacao> locacoes = [];
List<Funcionario> funcionarios = [];

void exibirMenuCadastros() {
  print("Menu Cadastros\n"
      "1 - Cadastrar Cliente\n"
      "2 - Cadastrar Marca\n"
      "3 - Cadastrar Modelo\n"
      "4 - Cadastrar Veículo\n"
      "5 - Cadastrar Funcionário\n"
      "6 - Sair");
}

void exibirClientes() {
  if(clientes.length > 0){
    for(var cliente in clientes){
      print("Id do Cliente:${cliente.id} Nome:${cliente.nome} CPF:${cliente.cpf} Endereço:${cliente.endereco}");
    }
  }else{
    print("Ainda não há clientes cadastrados no sistema.");
  }
}
int topoCliente = 0;
void addCliente() {
  var cliente = new Cliente();
  print("Cliente: ${topoCliente}");
  cliente.id = topoCliente;
  exibirClientes();
  print("Informe o nome do cliente");
  cliente.nome = stdin.readLineSync();
  print("Informe o CPF do cliente");
  cliente.cpf = int.parse(stdin.readLineSync()!);
  print("Informe o endereço do cliente");
  cliente.endereco = stdin.readLineSync()!;
  clientes.add(cliente);
  //exibirCliente();
  topoCliente = topoCliente + 1;
}

void exibirMarca(){
  if(marcas.length > 0){
    for(var marca in marcas){
      print("id da Marca:${marca.id} Nome:${marca.nome}");
    }
  }else{
    print("Ainda não há marcas cadastradas no sistema.");
  }
}
int topoMarca = 0;
void addMarca() {
  var marca = new Marca();
  exibirMarca();
  print("Cadastro Marca: ${topoMarca}");
  marca.id = topoMarca;
  print("Informe a marca do carro");
  marca.nome = stdin.readLineSync()!;
  marcas.add(marca);
  topoMarca = topoMarca + 1;
}

void exibirModelo() {
  /*for(int i = 0; i < modelos.length; i++){
    print("id:${modelos[i].id} Nome:${modelos[i].nome}");
  }*/
  if(modelos.length > 0){
    for(var modelo in modelos){
      print("id do Modelo:${modelo.id} Nome:${modelo.nome}");
    }
  }else{
    print("Ainda não há modelos cadastradas no sistema.");
  }
}
int topoModelo = 0;
void addModelo() {
  if(marcas.length == 0){
    print("Cadastre uma marca no sistema para cadastrar um modelo.");
  }else{
    var modelo = new Modelo();
    print("Cadastro Modelo: ${topoModelo}");
    modelo.id = topoModelo;
    exibirModelo();
    print("Informe o modelo do carro");
    modelo.nome = stdin.readLineSync()!;
    modelos.add(modelo);
    topoModelo = topoModelo + 1;
  }
}

void exibirVeiculos(){
  for(int i = 0; i < veiculos.length; i++){
    print("idVeiculo:${veiculos[i].id } idMarca:${veiculos[i].id_marca} idModelo:${veiculos[i].id_modelo} kmRodado:${veiculos[i].km_rodado} Valor Diária:${veiculos[i].valor} Marca:${pegarNomeMarca(veiculos[i].id_marca)} Modelo:${pegarNomeVeiculo(veiculos[i].id_modelo)}");
  }
}
bool validaLista(int? id, var lista){
  bool valida = false;
  for(int i = 0; i < lista.length; i++){
    if(lista[i].id == id){
      valida = true;
      break;
    }
  }
  return valida;
}

int topoVeiculo = 0;
void addVeiculo() {
  if(modelos.length > 0 && marcas.length > 0){
    int respAddVeiculos = 0;
    var veiculo = new Veiculo();
    exibirVeiculos();
    print("Cadastro Veiculo id: ${topoVeiculo}");
    veiculo.id = topoVeiculo;
    exibirMarca();
    print("Informe o id da marca do veículo: ");
    veiculo.id_marca = int.parse(stdin.readLineSync()!);
    if(validaLista(veiculo.id_marca, marcas) == false){
      print("Não existe modelo cadastrado o id informado.");
    }else{
      exibirModelo();
      print("Informe o id do modelo do veículo: ");
      veiculo.id_modelo = int.parse(stdin.readLineSync()!);
      if(validaLista(veiculo.id_modelo, modelos) == false){
        print("Não existe modelo cadastrado o id informado.");
      }else{
        print("Informe a kilometragem do veículo: ");
        veiculo.km_rodado = int.parse(stdin.readLineSync()!);
        print("Informe o valor da diária do veículo");
        veiculo.valor = double.parse(stdin.readLineSync()!);
        veiculos.add(veiculo);
        topoVeiculo = topoVeiculo + 1;
      }
    }
  }else {
    print("Não há informações de cadastro necessárias para registrar um veículo no sistema.");
  }
}

void exibirFuncionarios() {
  if(funcionarios.length > 0){
    for(int i = 0; i < funcionarios.length; i++){
      print("idFuncionario:${funcionarios[i].id} Nome:${funcionarios[i].nome} Telefone:${funcionarios[i].telefone}");
    }
  }else{
    print("Ainda não há funcionários cadastrados no sistema.");
  }
}

int topoFuncionario = 0;
void addFuncionario(){
  var funcionario = new Funcionario();
  exibirFuncionarios();
  print("Informe o id do funcionário: ${topoFuncionario}");
  funcionario.id = topoFuncionario;
  print("Informe o nome do funcionário:");
  funcionario.nome = stdin.readLineSync()!;
  print("Informe o telefone do funcionário:");
  funcionario.telefone = int.parse(stdin.readLineSync()!);
  funcionarios.add(funcionario);
  topoFuncionario = topoFuncionario + 1;
}
int? respMenuCad;
void cadastro() {
  int? opMenuCadastro;
  do{
    exibirMenuCadastros();
    opMenuCadastro = int.parse(stdin.readLineSync()!);
    switch(opMenuCadastro){
      case 1:
        addCliente();
        break;
      case 2:
        addMarca();
        break;
      case 3:
        addModelo();
        break;
      case 4:
        addVeiculo();
        break;
      case 5:
        addFuncionario();
        break;
      case 6:
        respMenuCad = 6;
        break;
    }
  }while(respMenuCad != 6);
}

void exibirLocacoes() {
  for(var locacao in locacoes){
    print("idLocação:${locacao.id} idCliente:${locacao.id_cliente} idVeículo:${locacao.id_veiculo} Data_Saída:${locacao.data_saida} Data_Entrega:${locacao.data_entrega} Dias:${locacao.dias_locado}");
  }
}

int topoLocacao = 0;
void addLocacao() {
  if(clientes.length > 0 && marcas.length > 0 && modelos.length > 0 && veiculos.length > 0 && funcionarios.length > 0){
    exibirLocacoes();
    var locacao = new Locacao();
    print("Cadastro Locação: ${topoLocacao}");
    locacao.id = topoLocacao;
    exibirClientes();
    print("Informe o id do cliente que está locando o carro: ");
    locacao.id_cliente = int.parse(stdin.readLineSync()!);
    while(validaLista(locacao.id_cliente, clientes) == false){
      print("Informe o id de um cliente válido.");
      locacao.id_cliente = int.parse(stdin.readLineSync()!);
    }
    exibirVeiculos();//exibirModelo();
    print("Informe o id do veiculo que está sendo locado: ");
    locacao.id_veiculo = int.parse(stdin.readLineSync()!);
    //print("Informe a data de saída do veículo: ");
    locacao.data_saida = DateTime.now();//locacao.data_saida = int.parse(stdin.readLineSync()!);
    //print("Informe a data de entrega do veículo: ");
    //locacao.data_entrega = int.parse(stdin.readLineSync()!);
    //print("Informe por quantos dias o carro foi locado:");
    print("Informe por quantos dias o carro vai ser locado:");
    locacao.dias_locado = int.parse(stdin.readLineSync()!);
    locacao.data_entrega = locacao.data_saida.add(Duration(days: locacao.dias_locado!));
    print("Data de entrega do veículo:${locacao.data_entrega}");
    exibirFuncionarios();
    print("Funcionário, informe seu ID:");
    locacao.id_funcionario = int.parse(stdin.readLineSync()!);
    locacoes.add(locacao);
    topoLocacao = topoLocacao + 1;
  }else{
   print("O sistema não possui os cadastros necessários para registrar uma locação.");
  }
}

String? nomeCliente(int idCliente) {
  String? nomeCliente = '';
  for(int i = 0; i < clientes.length; i++){
    if(clientes[i].id == idCliente){
      nomeCliente =  clientes[i].nome;
      return nomeCliente;
    }
  }
  //return 0;
}

double pegarValorPorDia(int? idVeiculoNaLocacao){
  double valor = 0;
  for(int i = 0; i < veiculos.length; i++) {
    if(veiculos[i].id == idVeiculoNaLocacao){
      valor = veiculos[i].valor!;
      break;
    }
  }
  return valor;
}

double valorPorDia = 0;
int idVeiculoNaLocacao = 0;
int diasLocado = 0;
int idCliente = 0;
void locacoesCliente() {
  exibirClientes();
  print("Informe o id do cliente que deseja obter o relatório de locações:");
  idCliente = int.parse(stdin.readLineSync()!);
  if(validaLista(idCliente, clientes) == false){
    print("Não existem locações cadastradas com esse cliente.");
  }else{
    for(int i = 0; i < locacoes.length; i++){
      if(locacoes[i].id_cliente == idCliente){
        idVeiculoNaLocacao = locacoes[i].id_veiculo!; //veiculo[i].modelo
        diasLocado = locacoes[i].dias_locado!;
        valorPorDia = pegarValorPorDia(idVeiculoNaLocacao);   //trackNomeVeiculo(modeloVeiculo(idVeiculoNaLocacao))
        print("idLocação:${locacoes[i].id} Cliente:${nomeCliente(idCliente)} Veículo:${pegarNomeVeiculo(pegarIdModeloVeiculo(idVeiculoNaLocacao))} Total:${calcTotal(diasLocado, valorPorDia)}"); //Total:${calcTotal(diasLocado, valorPorDia)
      }
    }
  }
}
double total = 0;
double? calcTotal(int dias, double valor) {
  total = dias * valor;
  return total;
}

//      Relatório Locação Por nome do FUNCIONÁRIO
String nomeFunc = '';
String? nomeFuncionario(int? idFuncionario){
  for(int i = 0; i < funcionarios.length; i++){
    if(funcionarios[i].id == idFuncionario){
      nomeFunc = funcionarios[i].nome!;
      break;
    }
  }
  return nomeFunc;
}

int totalLocFunc = 0;
int? totalLocacoesFuncionario(int? idFuncionario){
  for(int i = 0; i < funcionarios.length; i++){
    if(funcionarios[i].id == idFuncionario){
      funcionarios[i].totalLocacoes = funcionarios[i].totalLocacoes! + 1;
      totalLocFunc = funcionarios[i].totalLocacoes!;
      break;
    }
  }
  return totalLocFunc;
}

int idFuncionario = 0;
int countLocacoesFuncionario = 0;
void locacoesFuncionario() {
  countLocacoesFuncionario = 0;
  exibirFuncionarios();
  print("Informe o id do funcionário que realizou a locação:");
  idFuncionario = int.parse(stdin.readLineSync()!);
  if(validaLista(idFuncionario, funcionarios)){
    for(int i = 0; i < locacoes.length; i++){
      if(locacoes[i].id_funcionario == idFuncionario){
        countLocacoesFuncionario = countLocacoesFuncionario + 1;
        print("IdLocação:${locacoes[i].id}  NomeFuncionário:${nomeFuncionario(idFuncionario)}");
      }
    }
    print("Total de locações do funcionário ${nomeFuncionario(idFuncionario)}: ${countLocacoesFuncionario}");
  }else{
    print("Não existem locações cadastradas por esse funcionário.");
  }
}

int idModelo2 = 0;
int? pegarIdModeloVeiculo(int? isIdVeiculo) {
  for (int i = 0; i < veiculos.length; i++) {
    if (veiculos[i].id == isIdVeiculo) {
      idModelo2 = veiculos[i].id_modelo!;
      break;
    }
  }
  return idModelo2;
}
String? nomeModelo;
String? pegarNomeVeiculo(int? pegarModelo){
  for(int i = 0; i < modelos.length; i++){
    if(modelos[i].id == pegarModelo){
      nomeModelo = modelos[i].nome;
      break;
    }
  }
  return nomeModelo;
}

String? nomeMarca;
String? pegarNomeMarca(int? pegarMarca){
  for(int i = 0; i < modelos.length; i++){
    if(modelos[i].id == pegarMarca){
      nomeMarca = modelos[i].nome;
      break;
    }
  }
  return nomeMarca;
}

int idVeiculo = 0;
int count = 0;
void locacoesVeiculo() {
  count = 0;
  exibirVeiculos();
  print("Informe o id do veículo das locações que deseja consultar:");
  idVeiculo = int.parse(stdin.readLineSync()!);
  if(validaLista(idVeiculo, veiculos) == false){
    print("Não há locações cadastradas com veículo informado.");
  }else{
    for(int i = 0; i < locacoes.length; i++){
      if(locacoes[i].id_veiculo == idVeiculo){
        count = count + 1;
        print("idLocação:${locacoes[i].id} NomeVeiculo:${pegarNomeVeiculo(pegarIdModeloVeiculo(idVeiculo))} Total:");//QuantidadeLocado:${quantLocVeiculo(idVeiculo) - quantidadeLocacoesVeiculo
      }
    }
    print("Quantidade de Locações com o veículo id${idVeiculo} - Modelo:${pegarNomeVeiculo(idVeiculo)}: ${count}");
  }
}


int? opRelatorio;
void relatorios() {
  if(locacoes.length == 0){
    print("Não há locações cadastradas no sistema.");
  }else{
    print("Menu Relatórios\n"
        "1 - Locações por Cliente (nome do cliente, nome do veiculo, total pago)\n"
        "2 - Locações por Funcionário (nome do funcionário, total de locações)\n"
        "3 - Locações por Veiculo (nome do veiculo, quantidade locada)\n"
        "4 - Menu Principal");
    opRelatorio = int.parse(stdin.readLineSync()!);
    switch(opRelatorio){
      case 1:
        locacoesCliente();
        break;
      case 2:
        locacoesFuncionario();
        break;
      case 3:
        locacoesVeiculo();
        break;
      case 4:
        break;
    }
  }
}

void exibirMenuPrincipal(){
  print("Menu Principal\n"
      "1 - Cadastros\n"
      "2 - Locação\n"
      "3 - Relatórios\n"
      "4 - Sair");
}
int opMenuP = 0;
int resp = 0;
void main() {
  while(opMenuP != 4){
    try{
      exibirMenuPrincipal();
      opMenuP = int.parse(stdin.readLineSync()!);
      switch(opMenuP) {
        case 1:
          cadastro();
          break;
        case 2:
          addLocacao();
          break;
        case 3:
          relatorios();
          break;
        case 4:
          break;
      }
    }catch(e){
      print("---ERRO---");
    }
  }
}