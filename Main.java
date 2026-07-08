import java.io.FileReader;
import java.io.Reader;

public class Main {
    public static void main(String[] args) {
        try {
            Reader leitor = new FileReader("codigo_robo.txt");
            Lexer scanner = new Lexer(leitor);
            parser sintatico = new parser(scanner);
            sintatico.parse();
            System.out.println("SUCESSO: O codigo do robo esta correto e sem erros de sintaxe!");
        } catch (Exception e) {
            System.out.println("FALHA: " + e.getMessage());
        }
    }
}