package net.kafka.producer.tail;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import net.kafka.producer.util.ConfigFactory;
import net.kafka.producer.util.ConfigProperties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class TPMain {
	static Logger log = Logger.getLogger(DirectoryMoniter.class);

	public static void main(String[] args) throws IOException,
			InterruptedException {
		ConfigProperties configProp = ConfigFactory.getInstance()
				.getConfigProperties(ConfigFactory.LOG4J_CONFIG_PATH);
		PropertyConfigurator.configure(configProp);

		log.info("Tail Producer Main starting");
		configProp = ConfigFactory.getInstance().getConfigProperties(
				ConfigFactory.KAFKA_CONFIG_PATH);

		DirectoryMoniter dm = new DirectoryMoniter(configProp);
		Thread t = new Thread(dm);
		t.start();
		log.info("config file [" + configProp.getProperty("baseDirectory")
				+ "] monitor started");

		// File config = new File("./");
		// for (File f : config.listFiles()) {
		// System.out.println(f.getName());
		// if (f.isFile() && f.getName().equals("kafka.properties")) {
		// DirectoryMoniter dm = new DirectoryMoniter(f.getAbsolutePath());
		// Thread t = new Thread(dm);
		// t.start();
		// log.info("config file [" + f.getAbsolutePath()
		// + "] monitor started");
		// }
		// }
//		while (true) {
//			TimeUnit.MILLISECONDS.sleep(10000);
//		}
	}

}
