import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;
import java.nio.charset.StandardCharsets;

/*  j ava2s  .com*/
public class MainClass {

    public static void main(String[] args)
            throws IOException {

        URL u = new URL("http://localhost:4433/who_am_i");
        String host = u.getHost();
        int port = u.getPort();
        String file = u.getFile();

        SocketAddress remote = new InetSocketAddress(host, port);
        SocketChannel channel = SocketChannel.open(remote);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        // FileChannel localFile = out.ggetChannel();

        String request = "GET " + file + " HTTP/1.1\r\n" + "User-Agent: HTTPGrab\r\n"
                + "Accept: text/*\r\n" + "Connection: close\r\n" + "Host: " + host + "\r\n" + "\r\n";

        ByteBuffer header = ByteBuffer.wrap(request.getBytes(StandardCharsets.UTF_8));
        channel.write(header);

        ByteBuffer buffer = ByteBuffer.allocate(8192);
        while (channel.read(buffer) != -1) {
            buffer.flip();
            out.write(buffer.array());
            buffer.clear();
        }

        final String response = new String(out.toByteArray(), StandardCharsets.UTF_8);
        // localFile.close();
        if (!response.contains("200")) {
            throw new RuntimeException();
        }
        out.close();
        channel.close();
    }
}