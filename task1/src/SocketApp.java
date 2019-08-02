import java.io.*;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

public class SocketApp {

    private static final String HTTP_REQUEST = "GET /who_am_i HTTP/1.1\r\n" +
            "Host: localhost:4433\r\n" +
            "User-Agent: PostmanRuntime/7.15.2\r\n" +
            "Accept: */*\r\n" +
            "Cache-Control: no-cache\r\n" +
            "Host: localhost:4433\r\n" +
            "Accept-Encoding: gzip, deflate\r\n" +
            "Connection: close\r\n" +
            "cache-control: no-cache\r\n" +
            "Content-Length: 7\r\n" +
            "\r\n" +
            "a=1&b=2\r\n";

    public static void main(String[] args) {

        get();
    }

    private static void get() {
        try (
                final Socket socket = new Socket("localhost", 4433);
                final BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), StandardCharsets.UTF_8));
                final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream(), StandardCharsets.UTF_8));
        ) {

            bufferedWriter.write(HTTP_REQUEST);
            bufferedWriter.flush();

            final String response = bufferedReader.readLine();
            if (!response.contains("200")) {
                throw new RuntimeException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
