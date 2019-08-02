import java.io.InputStream;
import java.net.URL;
import java.time.Duration;
import java.time.LocalTime;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.LongAdder;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static java.time.format.DateTimeFormatter.ISO_TIME;

public class App {

    private static final long DURATION = Duration.ofSeconds(3).toMillis();

    private static final int PROCESSORS = Runtime.getRuntime().availableProcessors() * 2;

    public static void main(String[] args)
            throws Exception {
        if (args.length != 1) {
            throw new IllegalAccessException("No arguments found");
        }
        final String url = args[0];
        LongAdder ok = new LongAdder();
        LongAdder error = new LongAdder();
        LocalTime before = LocalTime.now();
        System.out.println("Start " + before.format(ISO_TIME));
        ExecutorService pool = Executors.newFixedThreadPool(PROCESSORS);
        IntStream.range(0, PROCESSORS)
                .mapToObj(n -> CompletableFuture.runAsync(command(url, ok, error), pool))
                .collect(Collectors.toList())
                .forEach(CompletableFuture::join);
        pool.shutdown();
        LocalTime after = LocalTime.now();
        System.out.println("Finish " + after.format(ISO_TIME));
        System.out.println("Time: " + Duration.between(before, after).getSeconds());
        System.out.println("Success: " + ok.longValue());
        System.out.println("Error: " + error.longValue());
    }

    private static Runnable command(String url, LongAdder ok, LongAdder error) {
        return () -> {
            long before = System.currentTimeMillis();
            long okCount = 0;
            long errCount = 0;
            while (System.currentTimeMillis() < before + DURATION) {
                try {
                    get(url);
                    okCount++;
                } catch (Exception e) {
                    errCount++;
                }
            }
            ok.add(okCount);
            error.add(errCount);
        };
    }

    private static void get(String url)
            throws Exception {
        try (InputStream inputStream = new URL(url).openStream()) {
        }
    }
}
