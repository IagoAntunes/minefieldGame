import 'package:campominado/store/campo.store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Campo',
    () {
      test('Abrir campo explosao', () {
        Campo campo = Campo(linha: 0, coluna: 0);
        campo.minar();
        expect(campo.abrir, throwsException);
      });
      test('Abrir campo sem explosao', () {
        Campo campo = Campo(linha: 0, coluna: 0);
        campo.abrir();
        expect(campo.aberto, true);
      });
      test('Adicionar não vizinho', () {
        Campo campo = Campo(linha: 0, coluna: 0);
        Campo campo2 = Campo(linha: 0, coluna: 3);
        campo.addVizinho(campo2);
        expect(campo.vizinhos.isEmpty, true);
      });
      test(
        'Adicionar vizinho',
        () {
          Campo campo = Campo(linha: 3, coluna: 3);
          Campo campo2 = Campo(linha: 3, coluna: 4);
          Campo campo3 = Campo(linha: 2, coluna: 2);
          Campo campo4 = Campo(linha: 4, coluna: 4);
          campo.addVizinho(campo2);
          campo.addVizinho(campo3);
          campo.addVizinho(campo4);
          expect(campo.vizinhos.length, 3);
        },
      );
      test(
        'Vizinhos minados',
        () {
          Campo campo = Campo(linha: 3, coluna: 3);
          Campo campo2 = Campo(linha: 3, coluna: 4);
          campo2.minar();
          Campo campo3 = Campo(linha: 2, coluna: 2);
          Campo campo4 = Campo(linha: 4, coluna: 4);
          campo4.minar();
          campo.addVizinho(campo2);
          campo.addVizinho(campo3);
          campo.addVizinho(campo4);
          expect(campo.qtdMinasVizinhanca.bitLength, 2);
        },
      );
    },
  );
}
